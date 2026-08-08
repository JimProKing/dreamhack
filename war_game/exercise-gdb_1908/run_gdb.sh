#!/usr/bin/env bash
# macOS: Linux ELF + gdb 를 Docker(amd64) 안에서 연다.
# 사전: Docker Desktop 또는 Rancher Desktop 실행 (docker info 가 성공해야 함)
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

if ! docker info >/dev/null 2>&1; then
  echo "Docker 데몬에 연결할 수 없습니다."
  echo "Rancher Desktop / Docker Desktop 을 켠 뒤 다시 실행하세요."
  exit 1
fi

chmod +x ./main

# 이미지가 없으면 받을 수 있음 (첫 실행 시 시간 걸림)
docker run --rm -it \
  --platform linux/amd64 \
  -v "$DIR:/work" \
  -w /work \
  ubuntu:24.04 \
  bash -c '
    if ! command -v gdb >/dev/null 2>&1; then
      apt-get update -qq
      DEBIAN_FRONTEND=noninteractive apt-get install -y -qq gdb >/dev/null
    fi
    chmod +x ./main
    echo "=== gdb 세션 시작. 아래 HANDS_ON.md 순서대로 입력 ==="
    exec gdb -q ./main
  '
