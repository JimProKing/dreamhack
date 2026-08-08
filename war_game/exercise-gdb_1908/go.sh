#!/usr/bin/env bash
# Exercise: GDB (#1908) — 단계별 실습 마법사
# 호스트 bash 가 아니라, 이 스크립트가 Docker 안 GDB 를 대신 돌리거나 열어 준다.
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"
IMG="dreamhack-gdb:ubuntu24"
MAIN="./main"

RED=$'\033[31m'
GRN=$'\033[32m'
YLW=$'\033[33m'
CYN=$'\033[36m'
BLD=$'\033[1m'
RST=$'\033[0m'

pause() {
  echo ""
  read -r -p "${YLW}[Enter] 를 누르면 다음으로...${RST} " _
}

need_docker() {
  if ! docker info >/dev/null 2>&1; then
    echo "${RED}Docker 가 꺼져 있습니다.${RST}"
    echo "  1) open -a \"Docker\"   (또는 Rancher Desktop 앱 실행)"
    echo "  2) 고래 아이콘이 안정될 때까지 대기"
    echo "  3) 다시:  ./go.sh"
    exit 1
  fi
}

ensure_image() {
  need_docker
  if ! docker image inspect "$IMG" >/dev/null 2>&1; then
    echo "${CYN}[*] GDB 이미지 빌드 중 (첫 1회, 1~3분)...${RST}"
    docker build --platform linux/amd64 -f Dockerfile.gdb -t "$IMG" .
    echo "${GRN}[+] 이미지 준비 완료${RST}"
  else
    echo "${GRN}[+] GDB 이미지 이미 있음${RST}"
  fi
  chmod +x "$MAIN" 2>/dev/null || true
}

# 배치 모드: 명령 파일 실행 후 결과 보여 줌
gdb_batch() {
  local script="$1"
  need_docker
  ensure_image
  echo "${CYN}----- GDB 출력 시작 -----${RST}"
  docker run --rm \
    --platform linux/amd64 \
    -v "$DIR:/work" \
    -w /work \
    "$IMG" \
    -batch -x "$script" "$MAIN" 2>&1 || true
  echo "${CYN}----- GDB 출력 끝 -----${RST}"
}

# 대화형: 사용자가 직접 입력
gdb_interactive() {
  need_docker
  ensure_image
  echo ""
  echo "${BLD}대화형 GDB${RST}"
  echo "프롬프트가 ${GRN}(gdb)${RST} 이면 성공. 호스트 ${RED}chan\$${RST} 이 아님!"
  echo "종료: quit"
  echo ""
  docker run --rm -it \
    --platform linux/amd64 \
    -v "$DIR:/work" \
    -w /work \
    "$IMG" \
    "$MAIN"
}

step0() {
  clear 2>/dev/null || true
  cat <<EOF
${BLD}========================================
 단계 0 · 환경 확인
========================================${RST}

이 바이너리(main)는 ${BLD}Linux x86-64${RST} 전용이다.
Mac 에서는 Docker 안에서 GDB 를 쓴다.

${YLW}주의:${RST}
  break / run / p/x  는 전부 GDB 명령이다.
  Mac 터미널 프롬프트(chan\$) 에 치면 실패한다.
  이 스크립트 메뉴 3~5 는 GDB 를 대신 실행해 준다.
EOF
  pause
  echo "Docker 연결 확인..."
  need_docker
  docker info 2>/dev/null | grep -E 'Server Version|Operating System' || true
  echo "${GRN}[+] Docker OK${RST}"
  pause
  ensure_image
  pause
}

step1() {
  clear 2>/dev/null || true
  cat <<EOF
${BLD}========================================
 단계 1 · main 구조 보기
========================================${RST}

할 일: 디스어셈블로 호출 흐름 확인.

볼 것:
  · call flag_1
  · 그 다음 주소  (= flag1 이 RAX 에 있는 순간)
  · movzx ... [a]  (= 전역 a 로 RAX 덮음)
  · test al, al / jne
  · call flag_2    (= a==0 일 때만)

이 빌드 기준:
  call flag_1 다음  →  ${GRN}0x401172${RST}
  test al, al       →  ${GRN}0x401179${RST}
EOF
  pause
  cat > /tmp/gdb_step1.cmd <<'EOF'
set pagination off
set disassembly-flavor intel
echo \n=== disas main ===\n
disas main
echo \n=== 심볼 ===\n
info address flag_1
info address flag_2
info address a
quit
EOF
  # copy into work dir for docker mount
  cp /tmp/gdb_step1.cmd "$DIR/.gdb_step1.cmd"
  gdb_batch .gdb_step1.cmd
  cat <<EOF

${GRN}정리${RST}
  flag_1 직후(0x401172) 에 멈추면 RAX = flag1
  그 다음 명령이 a 를 읽어 오면, 조건에 따라 flag_2 스킵
EOF
  pause
}

step2() {
  clear 2>/dev/null || true
  cat <<EOF
${BLD}========================================
 단계 2 · flag1 구하기
========================================${RST}

의도:
  flag_1() 이 반환한 직후 RAX 를 읽는다.
  (ABI: 정수 반환값 = RAX)

GDB 가 할 일:
  break *0x401172
  run
  p/x \$rax
EOF
  pause
  cat > "$DIR/.gdb_step2.cmd" <<'EOF'
set pagination off
set disassembly-flavor intel
break *0x401172
run
echo \n=== flag1 은 아래 RAX (hex) ===\n
printf "flag1 = 0x%lx\n", $rax
info registers rax
quit
EOF
  gdb_batch .gdb_step2.cmd
  cat <<EOF

${YLW}메모:${RST} 위에 나온 flag1 = 0x.... 를 적어 둬라.
제출 형식: DH{flag1-flag2}
EOF
  pause
}

step3() {
  clear 2>/dev/null || true
  cat <<EOF
${BLD}========================================
 단계 3 · flag2 조건 이해하기
========================================${RST}

main 흐름 (개념):

  call flag_1          → RAX = flag1
  movzx eax, byte [a]  → RAX = 전역 a  (기본값 1)
  test al, al
  jne  skip            → a != 0 이면 flag_2 안 탐
  call flag_2
  skip:

그래서 그냥 run 만 하면 flag2 출력이 없다.
test 직전/직후에서 ${GRN}set \$rax = 0${RST} 하면 분기를 통과한다.

지금은 전역 a 값만 확인한다.
EOF
  pause
  cat > "$DIR/.gdb_step3.cmd" <<'EOF'
set pagination off
set disassembly-flavor intel
break *0x401179
run
echo \n=== test al,al 직전: a 가 로드된 RAX ===\n
printf "rax = 0x%lx  (0 이 아니면 flag_2 스킵)\n", $rax
x/bx &a
echo \n(여기서 set $rax=0 하면 다음 단계에서 flag_2 진입)\n
quit
EOF
  gdb_batch .gdb_step3.cmd
  pause
}

step4() {
  clear 2>/dev/null || true
  cat <<EOF
${BLD}========================================
 단계 4 · flag2 구하기 (조건 우회)
========================================${RST}

  break *0x401179
  run
  set \$rax = 0
  continue

→ flag_2 가 printf 로 출력: flag2 is 0x....
EOF
  pause
  cat > "$DIR/.gdb_step4.cmd" <<'EOF'
set pagination off
set disassembly-flavor intel
break *0x401179
run
echo \n=== 우회: set $rax = 0 ===\n
set $rax = 0
printf "rax now = 0x%lx\n", $rax
echo \n=== continue → flag_2 출력 기대 ===\n
continue
quit
EOF
  gdb_batch .gdb_step4.cmd
  cat <<EOF

${YLW}메모:${RST} flag2 is 0x.... 줄을 적어 둬라.
최종: DH{flag1-flag2}
  예) DH{0x....-0x....}
EOF
  pause
}

step5() {
  clear 2>/dev/null || true
  cat <<EOF
${BLD}========================================
 단계 5 · 직접 타이핑 (선택)
========================================${RST}

이제 (gdb) 안에서 직접 쳐 본다.
호스트 셸(chan\$) 이 아니라 ${GRN}(gdb)${RST} 인지 확인!

추천 순서:
  set disassembly-flavor intel
  disas main
  break *0x401172
  run
  p/x \$rax
  delete
  break *0x401179
  run
  set \$rax = 0
  continue
  quit
EOF
  pause
  gdb_interactive
}

step6() {
  clear 2>/dev/null || true
  cat <<EOF
${BLD}========================================
 단계 6 · 정답 대조 (스포일러)
========================================${RST}

직접 구한 값과 맞는지 확인만 한다.
아직 안 풀었으면 이 메뉴는 건너뛰어도 된다.
EOF
  pause
  if [[ -f ./solve.py ]]; then
    echo "solve.py 결과:"
    python3 ./solve.py 2>/dev/null || true
  fi
  echo ""
  echo "자세한 설명: README.md"
  pause
}

menu() {
  clear 2>/dev/null || true
  cat <<EOF
${BLD}╔══════════════════════════════════════════╗
║   Exercise: GDB (#1908)  단계별 실습     ║
╚══════════════════════════════════════════╝${RST}

  ${CYN}0${RST}  환경 확인 + GDB 이미지 준비
  ${CYN}1${RST}  main 구조 보기 (disas)
  ${CYN}2${RST}  flag1 구하기 (자동 GDB)
  ${CYN}3${RST}  flag2 조건 이해하기
  ${CYN}4${RST}  flag2 구하기 · 조건 우회 (자동 GDB)
  ${CYN}5${RST}  직접 GDB 치기 (대화형)
  ${CYN}6${RST}  정답 대조 (spoiler)
  ${CYN}a${RST}  0→1→2→3→4 한 번에 진행
  ${CYN}q${RST}  종료

${YLW}기억:${RST} GDB 명령은 메뉴 2·4·5 가 열어 주는 세션 안에서만.
EOF
  read -r -p "선택 > " choice
  case "$choice" in
    0) step0 ;;
    1) step1 ;;
    2) step2 ;;
    3) step3 ;;
    4) step4 ;;
    5) step5 ;;
    6) step6 ;;
    a|A)
      step0
      step1
      step2
      step3
      step4
      echo "${GRN}자동 단계 끝. 직접 치려면 메뉴 5.${RST}"
      pause
      ;;
    q|Q) echo "끝."; exit 0 ;;
    *) echo "다시 선택"; sleep 1 ;;
  esac
}

# cleanup temp cmd files on exit
cleanup() { rm -f "$DIR"/.gdb_step*.cmd 2>/dev/null || true; }
trap cleanup EXIT

while true; do
  menu
done
