# baby-linux (#837)

- 링크: https://dreamhack.io/wargame/challenges/837
- 카테고리: Beginner
- 공부 로그: `log_for_study/2026-08-05.md` (리눅스 기본 명령 + 풀이)

## 한 줄 요약

웹에서 리눅스 명령 실행. `flag` 단어 필터를 피해서 `flag.txt` 읽기.

## 풀이

```text
ls
cat hint.txt
ls ./dream/hack/hello/
cat ./dream/hack/hello/*
```

| 포인트 | 내용 |
|--------|------|
| 필터 | 명령에 `flag` 포함 시 `No!` |
| 우회 | `*` / `?` 글로브로 파일명 생략 |
| 경로 힌트 | `hint.txt` → `./dream/hack/hello/` |

## 관련 리눅스 명령

| 명령 | 용도 |
|------|------|
| `ls` / `ls -la` | 목록 |
| `cat` | 파일 출력 |
| `pwd` / `cd` | 경로 / 이동 |
| `*` | 아무 이름 매칭 |
| `?` | 문자 1개 매칭 |

자세한 명령 표: `log_for_study/2026-08-05.md`
