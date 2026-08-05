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
# 또는
tail ./dream/hack/hello/*
```

| 포인트 | 내용 |
|--------|------|
| 필터 | 명령에 `flag` 포함 시 `No!` |
| 우회 | `*` / `?` 글로브로 파일명 생략 |
| 경로 힌트 | `hint.txt` → `./dream/hack/hello/` |

### 터미널 색 힌트 (파일 안 문구)

```text
Changed to terminal color! Only the tail command can read this string correctly!... or drag? :
```

| 힌트 | 할 일 |
|------|--------|
| `tail` | `tail ./dream/hack/hello/*` 등으로 다시 읽기 |
| drag | 출력 영역을 **마우스로 드래그 선택** → 숨은 글자 노출 |
| 기타 | `cat -v`, `od -c`, `xxd` 로 제어문자/색 코드 확인 |

검정 글자 + 검정 배경(ANSI)이면 `cat` 만으로는 안 보일 수 있음.

## 관련 리눅스 명령

| 명령 | 용도 |
|------|------|
| `ls` / `ls -la` | 목록 |
| `cat` | 전체 출력 |
| `head` / `tail` | 앞 / **뒤** n줄 |
| `pwd` / `cd` | 경로 / 이동 |
| `*` / `?` | 글로브 |
| `cat -v` | 눈에 안 보이는 문자 표시 |

자세한 표: `log_for_study/2026-08-05.md`
