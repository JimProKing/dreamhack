# addition-quiz (#1114)

- 링크: https://dreamhack.io/wargame/challenges/1114
- 카테고리: misc
- 공부 로그: `log_for_study/2026-08-03.md`
- 풀이: `solve.py` · 소스: `chall.c` (로컬 `chall` 바이너리 포함 가능)

## 한 줄 요약

`a+b=?` 형태 문제를 **1초 제한**으로 50번 맞춰야 flag.

## 관찰

| 항목 | 내용 |
|------|------|
| 프로토콜 | TCP. 한 줄 문제 → 한 줄 답 |
| 제약 | 문제마다 ~1초 (`alarm` 계열) |
| 횟수 | 50회 연속 |
| 수동 한계 | 손 입력으로는 시간·횟수 모두 비현실적 |

출력 형태: `3142+8901=?`

## 절차

```bash
# solve.py 의 HOST, PORT 를 인스턴스 값으로 수정
# Port A/tcp → B/tcp 이면 접속 포트는 A
python solve.py

# 로컬 바이너리 테스트 시 solve.py 에서 process('./chall')
```

## 왜 되는지

1. `recvuntil(b"+")` / `recvuntil(b"=?\n")` 로 피연산자를 파싱  
2. 합을 계산해 `sendline`  
3. 루프 50회 — 네트워크 왕복만 하면 1초 제한 안

핵심은 산술이 아니라 **시간 제약 하의 프로토콜 I/O 자동화**.
