# 7. 파일 디스크립터 (File Descriptor)

- 강의: [Linux File Descriptors](https://dreamhack.io/lecture/units/file-descriptors)
- Lab: https://learn.dreamhack.io/labs/ce3230e0-de58-474f-8661-6c5e9b72cf7e

## 무엇을 배우나

- **fd** 가 무엇인지  
- **pipe `|`**, **리다이렉션**, **grep** 으로 입출력 다루기  

---

## 개념 — fd

프로세스가 파일·터미널·파이프를 열면 커널이 **정수 번호**를 준다.

| fd | 이름 | 역할 |
|----|------|------|
| **0** | stdin | 표준 입력 |
| **1** | stdout | 표준 출력 |
| **2** | stderr | 표준 에러 |
| **3+** | | 추가로 연 파일 등 |

```text
[키보드] --0-->  프로세스  --1--> [화면]
                      |
                      2 --> [에러]
                      3,4 → 연 파일들
```

### 열린 fd 보기 / 개수

```bash
ls -l /proc/$$/fd
ls /proc/$$/fd | wc -l
```

| 기호 | 의미 |
|------|------|
| `$$` | 현재 셸 PID |
| `/proc/PID/fd/` | 그 프로세스가 연 fd 목록 |
| `wc -l` | 개수 |

**랩 문제:** 현재 셸 열린 fd 개수 → 위 숫자 제출.

---

## 파이프 `|`

```text
명령A | 명령B
```

A의 **stdout** → B의 **stdin**. 화면을 거치지 않고 연결.

```bash
cat pipe_grep_file | grep '패턴'
```

---

## grep 과 `.*`

```bash
grep '패턴' 파일
명령 | grep '패턴'
grep -o '패턴'    # 맞은 부분만
```

| 패턴 | 의미 |
|------|------|
| `^` / `$` | 줄 시작 / 끝 |
| `.` | 아무 문자 1개 |
| `*` | 앞 요소 0번 이상 |
| `.*` | 가운데 아무 문자열 |

**`.` 이 왜 들어가나**  
`IIIII.*lllll` = `IIIII` + (사이 뭐든) + `lllll`.  
`.*` 가 “사이는 상관없다”.

---

## 랩 문제 — pipe + grep + cat

**물음:** `pipe_grep_file` 에서 `IIIII` 로 시작, `lllll` 로 끝나는 문자열

```bash
# 권장 (줄 중간이어도 OK)
cat pipe_grep_file | grep -o 'IIIII.*lllll'

# 줄 전체가 정확히 그 형태일 때
cat pipe_grep_file | grep '^IIIII.*lllll$'
```

| 안 나올 때 | 조치 |
|------------|------|
| `^$` 때문에 실패 | `grep -o` 사용 |
| `\r` | `tr -d '\r' \| grep -o '...'` |

---

## 리다이렉션

| 문법 | 의미 |
|------|------|
| `>` | stdout → 파일 (덮어쓰기) |
| `>>` | stdout → 파일 (추가) |
| `<` | 파일 → stdin |
| `2>` | stderr → 파일 |
| `> 파일 2>&1` | stdout+stderr 같이 |

```bash
echo hello > out.txt
echo more >> out.txt
cat < out.txt
ls 없는파일 2> err.txt
```

`|` = 프로세스↔프로세스  
`>` = 프로세스↔**파일**

랩에 `redirect_test` 있으면:

```bash
명령 > redirect_test
cat redirect_test
```

---

## 치트시트

```bash
ls /proc/$$/fd | wc -l
ls -l /proc/$$/fd

cat 파일 | grep '패턴'
cat 파일 | grep -o 'IIIII.*lllll'

명령 > 파일
명령 >> 파일
명령 2> 에러파일
```

## 한 줄 정리

1. **fd** = 입출력 번호 (0·1·2 기본)  
2. **`|`** = 명령 연결  
3. **`>`** = 파일로 출력  
4. **grep** = 패턴 필터 (`.*` = 사이 아무 것)  

## 다음에

[08-users-groups.md](./08-users-groups.md)
