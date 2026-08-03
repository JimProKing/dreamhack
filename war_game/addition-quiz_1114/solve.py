#!/usr/bin/env python3
"""
Dreamhack Wargame #1114 - addition-quiz (misc)

문제 요약:
  - 서버가 "num1+num2=?" 형태 문제를 50번 냄
  - 문제마다 1초 제한 (alarm)
  - 50번 다 맞히면 flag 출력

풀이 요약:
  - 손으로 1초 안에 50번 못 함 → pwntools로 자동 응답
"""

from pwn import *

# 통신 내용 전부 보고 싶으면 아래 주석 해제
# context.log_level = 'debug'

# --------------------------------------------------
# 연결 설정
# Dreamhack에서 서버 켠 뒤 나오는 호스트/포트로 바꿀 것
# 예: Port 12771/tcp → 31337/tcp 이면 포트는 왼쪽(12771)
# --------------------------------------------------
HOST = "host3.dreamhack.games"
PORT = 12771

# remote: 원격 서버에 TCP 연결
# 로컬에서 chall 바이너리 테스트할 때는 process('./chall') 사용
p = remote(HOST, PORT)
# p = process("./chall")

# --------------------------------------------------
# 50문제 반복
# --------------------------------------------------
for i in range(50):
    # 서버 출력 예시: b"3142+8901=?\n"
    #
    # recvuntil(구분자, drop=True)
    #   - 구분자가 나올 때까지 데이터를 읽음
    #   - drop=True면 구분자는 버리고 그 앞만 반환
    #
    # 1) '+' 앞까지 읽으면 num1
    num1 = int(p.recvuntil(b"+", drop=True))

    # 2) '=?\n' 앞까지 읽으면 num2
    num2 = int(p.recvuntil(b"=?\n", drop=True))

    # 3) 합 계산 후 전송
    # sendline: 데이터 + 개행(\n) 을 보냄 (scanf가 숫자 읽을 때 필요)
    ans = num1 + num2
    p.sendline(str(ans).encode())

# --------------------------------------------------
# 50번 성공 시 "Nice!" + flag 가 옴
# recvall: 연결 끝날 때까지 (또는 timeout) 남은 출력 전부 수신
# --------------------------------------------------
print(p.recvall(timeout=2).decode(errors="ignore"))
