# flag-shop (#1874)

- 링크: https://dreamhack.io/wargame/challenges/1874
- 카테고리: misc
- 공부 로그: `log_for_study/2026-08-03.md`
- 풀이: `solve.py`

## 한 줄 요약

셔플된 10개 아이템 목록에서 **`flag` 의 인덱스**를 50라운드 연속으로 맞히기 (시간 제한).

## 관찰

| 항목 | 내용 |
|------|------|
| 매 라운드 | 목록이 다시 섞임 → 고정 인덱스 불가 |
| 목표 | `N. flag` 줄의 `N` 을 전송 |
| 제약 | 50라운드 + 시간 제한 → 스크립트 필수 |

출력 예:

```text
0. apple
1. grape
2. flag
...
Which item do you want to buy?
>
```

## 절차

```bash
# solve.py 의 HOST, PORT 수정 후
python solve.py
```

## 왜 되는지

1. `recvuntil(b". flag", drop=True)` 로 `flag` 줄 직전까지 수신  
2. 받은 버퍼의 **마지막 문자** = 인덱스 숫자  
3. 그 숫자를 `sendline` → 50회 반복

상태(셔플)를 예측하지 않고, **매 라운드 출력을 파싱**해 답을 만든다.
