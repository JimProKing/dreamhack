#!/usr/bin/env bash
# Docker 없이 단계별 학습 (알고리즘 재현 + GDB 명령 설명)
# 실제 GDB 는 Linux/Docker 가 살아 있을 때 ./go.sh 사용
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

CYN=$'\033[36m'
GRN=$'\033[32m'
YLW=$'\033[33m'
BLD=$'\033[1m'
RST=$'\033[0m'

pause() { echo ""; read -r -p "${YLW}[Enter] 다음${RST} " _; }

step() {
  local n="$1" title="$2"
  clear 2>/dev/null || true
  echo "${BLD}======== 단계 $n · $title ========${RST}"
  echo ""
}

step 0 "상황 정리"
cat <<EOF
main 은 Linux x86-64 ELF 이다.
지금 Mac 의 Docker 가 Server 500 / 멈춤 상태면
  → 실제 GDB 컨테이너를 못 띄운다.

이 스크립트는:
  · 각 단계에서 ${CYN}무슨 GDB 명령을 치는지${RST}
  · ${CYN}왜 그 주소인지${RST}
  · 같은 결과를 ${CYN}계산으로 확인${RST}
을 보여 준다.

Docker 고친 뒤에는 ./go.sh 로 진짜 GDB 를 반복하면 된다.
EOF
pause

step 1 "main 에서 볼 주소"
cat <<EOF
GDB 에서 칠 명령:
  ${GRN}set disassembly-flavor intel${RST}
  ${GRN}disas main${RST}

이 바이너리에서 확인된 흐름:

  0x40116d  call flag_1
  0x401172  ← flag_1 직후, RAX = flag1   ${YLW}break 여기${RST}
  0x401172  movzx eax, byte [a]   (전역 a=1 로 RAX 덮음)
  0x401179  test al, al           ${YLW}break 여기 후 set \$rax=0${RST}
  0x40117b  jne  skip
  0x40117d  call flag_2
EOF
pause

step 2 "flag1 — GDB 로 하면"
cat <<EOF
  ${GRN}break *0x401172${RST}
  ${GRN}run${RST}
  ${GRN}p/x \$rax${RST}

이유: 함수 반환값은 x86-64 에서 RAX 에 둔다.
call flag_1 이 끝난 직후가 flag1 을 읽는 순간이다.
(그 다음 명령이 a 를 읽어 RAX 를 덮으므로, 더 뒤로 가면 flag1 이 사라진다.)
EOF
pause
echo "${CYN}같은 값 계산 (CPU 64비트 래핑 + mod):${RST}"
python3 - <<'PY'
MASK=(1<<64)-1
mod,mul,add=0xfabc0897fabc0897,0xca084213,0xdeadbeefcafecafe
x=0
for _ in range(0x63+1):
    x=((x*mul)&MASK); x=((x+add)&MASK); x%=mod
print(f"  flag1 = {x:#x}")
print("  → GDB 의 p/x $rax 와 같아야 함")
PY
pause

step 3 "flag2 — 조건 때문에 그냥은 안 나옴"
cat <<EOF
전역 a 가 1 이라:

  test al, al
  jne  skip     ← a!=0 이면 flag_2 스킵

GDB:
  ${GRN}delete${RST}
  ${GRN}break *0x401179${RST}
  ${GRN}run${RST}
  ${GRN}p/x \$rax${RST}          # 지금은 0 이 아님 (a=1)
  ${GRN}set \$rax = 0${RST}     # 분기 우회
  ${GRN}continue${RST}

그러면 flag_2 가 printf 로 출력:
  flag2 is 0x....
EOF
pause
echo "${CYN}같은 값 계산:${RST}"
python3 - <<'PY'
MASK=(1<<64)-1
mod,mul,add=0xfbbbbbbbbbbbbbbb,0xcacacacacaca,0xdeadbeafbeaf
x=0
for _ in range(0x60+1):
    x=((x*mul)&MASK); x=((x+add)&MASK); x%=mod
print(f"  flag2 = {x:#x}")
print(f"  출력 예: flag2 is {x:#x}")
PY
pause

step 4 "제출 형식"
python3 - <<'PY'
MASK=(1<<64)-1
def sim(mod,mul,add,n):
    x=0
    for _ in range(n+1):
        x=((x*mul)&MASK); x=((x+add)&MASK); x%=mod
    return x
f1=sim(0xfabc0897fabc0897,0xca084213,0xdeadbeefcafecafe,0x63)
f2=sim(0xfbbbbbbbbbbbbbbb,0xcacacacacaca,0xdeadbeafbeaf,0x60)
print(f"  DH{{{f1:#x}-{f2:#x}}}")
PY
echo ""
echo "드림핵 제출란에 위 문자열 입력."
pause

step 5 "Docker 고치는 법 (진짜 GDB 용)"
cat <<EOF
지금 docker info 가 Server 500 이면 엔진이 죽은 상태.

${BLD}순서:${RST}
  1) 메뉴막 Docker 아이콘 → Quit Docker Desktop
  2) Rancher Desktop 도 켜져 있으면 Quit (하나만 쓰기)
  3) open -a "Docker"
  4) 2~3분 대기 후:  docker info
     → Server Version 이 보이면 OK
  5) 그래도 500:
       Docker → Settings(톱니) → Troubleshoot
       → Restart Docker Desktop
       → 안 되면 Clean / Purge data (이미지 다 지워짐)

${BLD}살아난 뒤 진짜 GDB:${RST}
  cd $DIR
  ./go.sh
  메뉴 a  또는  0 → 1 → 2 → 3 → 4 → 5
EOF
pause

echo "${GRN}로컬 단계 학습 끝.${RST}"
echo "Docker 고치면:  ./go.sh"
echo "전체 설명:      README.md / HANDS_ON.md"
