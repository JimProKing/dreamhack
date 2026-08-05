# 2. 리눅스 사용 맛보기

- 강의: [A Quick Look at Linux Usage](https://dreamhack.io/lecture/units/a-quick-look-at-linux-usage)
- 워게임: [baby-linux (#837)](https://dreamhack.io/wargame/challenges/837)
- 풀이 폴더: [war_game/baby-linux_837](../war_game/baby-linux_837/)

## 무엇을 배우나

리눅스에서 **명령을 입력하고 결과를 보는** 감각.  
파일 목록, 내용 읽기, 간단한 필터 우회까지.

## 기본 명령

| 명령 | 의미 |
|------|------|
| `pwd` | 현재 경로 |
| `ls` / `ls -la` | 목록 / 숨김+자세히 |
| `cd 경로` | 이동 |
| `cat 파일` | 내용 출력 |
| `head` / `tail` | 앞 / 뒤 일부 |

경로: `.` 현재, `..` 상위, `/` 루트, `~` 홈.

## 워게임 baby-linux

웹에서 리눅스 명령을 실행하는 서비스.  
명령 문자열에 **`flag` 가 들어가면** 거부.

```text
ls
cat hint.txt
ls ./dream/hack/hello/
cat ./dream/hack/hello/*      # 또는 tail ./dream/hack/hello/*
```

| 포인트 | 내용 |
|--------|------|
| 필터 | `'flag' in cmd` → `No!` |
| 우회 | `*` / `?` 글로브로 파일명에 flag 안 쓰기 |
| 색 힌트 | 안 보이면 `tail` 또는 드래그 선택 / `cat -v` |

## 셸 글로브

| 기호 | 의미 |
|------|------|
| `*` | 아무 문자열 |
| `?` | 문자 1개 |

셸이 먼저 파일 이름으로 펼친 뒤 명령에 넘긴다.

## 다음에

[03-shell.md](./03-shell.md) · [04-files-and-directories.md](./04-files-and-directories.md)
