# Exercise: Welcome-Beginners (#812)

- 링크: https://dreamhack.io/wargame/challenges/812
- 카테고리: Beginner
- 풀이 메모: 아래 + `log_for_study/2026-08-04.md`

## 한 줄 요약

서버에 접속해 `Dreamhack` 을 입력하면 플래그 출력.

## 풀이

1. 문제 페이지에서 **서버 생성하기**
2. 나온 host / port 로 접속
3. `Dreamhack` 입력
4. `DH{...}` 전체 제출

### 접속 예시 (Windows)

```powershell
ncat host3.dreamhack.games <PORT>
# 프롬프트에 Dreamhack 입력
```

### 실제 세션 (2026-08-04)

```text
ncat host3.dreamhack.games 12902
Enter "Dreamhack" : Dreamhack
Welcome Beginners!
DH{d6398f06b35117877a855ade8d2015fc3b142c3ca6686ce3198e372b9ef8a644}
```

포트는 서버를 다시 만들면 바뀜.
