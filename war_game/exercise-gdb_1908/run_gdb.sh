#!/usr/bin/env bash
# macOS → Docker(linux/amd64) 안 GDB
# 호스트 셸이 아니라 (gdb) 프롬프트에서 명령을 입력한다.
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"
IMG="dreamhack-gdb:ubuntu24"

if ! docker info >/dev/null 2>&1; then
  echo "Docker 가 안 켜져 있습니다. 앱을 켠 뒤:"
  echo "  open -a \"Docker\""
  echo "  또는  open -a \"Rancher Desktop\""
  echo "그다음:  docker info"
  exit 1
fi

chmod +x ./main

if ! docker image inspect "$IMG" >/dev/null 2>&1; then
  echo "[*] GDB 이미지 빌드 중 (한 번만, 1~3분 걸릴 수 있음)..."
  docker build --platform linux/amd64 -f Dockerfile.gdb -t "$IMG" .
fi

echo ""
echo "=============================================="
echo "  (gdb) 프롬프트가 보이면 성공."
echo "  아래 명령은 호스트 bash 가 아니라 gdb 안에 입력."
echo "  예시:"
echo "    set disassembly-flavor intel"
echo "    disas main"
echo "    break *0x401172"
echo "    run"
echo "    p/x \$rax"
echo "  종료: quit"
echo "=============================================="
echo ""

docker run --rm -it \
  --platform linux/amd64 \
  -v "$DIR:/work" \
  -w /work \
  "$IMG" \
  ./main
