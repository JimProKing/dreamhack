#!/usr/bin/env python3
"""
Dreamhack Wargame #1874 - flag-shop (misc)

문제 요약:
  - 과일 목록 10개 중 "flag" 가 섞여 있음
  - 매 라운드 순서가 셔플됨
  - flag 가 있는 인덱스(번호)를 맞혀야 함
  - 50라운드 연속 성공 + 시간 제한 통과 시 flag 파일 출력

풀이 요약:
  - 출력을 읽다가 ". flag" 줄을 찾고, 그 앞 숫자가 정답
  - 시간 제한 때문에 스크립트로 자동화
"""

from pwn import *

# context.log_level = 'debug'

# --------------------------------------------------
# 연결 설정 (Dreamhack 인스턴스 값으로 변경)
# Port: A/tcp → B/tcp 이면 remote 포트는 A
# --------------------------------------------------
HOST = "host3.dreamhack.games"
PORT = 22491

p = remote(HOST, PORT)

# --------------------------------------------------
# 50라운드 반복
# --------------------------------------------------
for i in range(50):
    # 서버 출력 예시:
    #   0. apple
    #   1. grape
    #   2. flag
    #   ...
    #   Which item do you want to buy?
    #   >
    #
    # recvuntil(b'. flag', drop=True)
    #   → "2. flag" 의 ". flag" 직전까지 읽음
    #   → 받은 문자열의 마지막 글자가 인덱스 '2'
    data = p.recvuntil(b". flag", drop=True)
    ans = data.decode()[-1]

    # 인덱스 번호 전송
    p.sendline(ans.encode())

# 성공 시 flag 문자열 출력
print(p.recvall(timeout=2).decode(errors="ignore"))
