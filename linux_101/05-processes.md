# 5. 프로세스 생성과 관리

- 강의: [Linux Process Creation and Management](https://dreamhack.io/lecture/units/processes)
- Lab: Linux - Process

## 프로세스란

실행 중인 프로그램의 인스턴스.  
각각 **PID**(번호)를 가진다.

## ELF 실행 파일 만들기 (랩)

`hello world!` 를 출력하는 **ELF** 파일, 이름 **`hello`**.

```bash
cat > hello.c << 'EOF'
#include <stdio.h>
int main(void) {
    printf("hello world!\n");
    return 0;
}
EOF

gcc -o hello hello.c
chmod +x hello
./hello
file hello          # ELF 인지 확인
```

| 채점 포인트 | 내용 |
|-------------|------|
| 파일명 | `hello` |
| 형식 | ELF (셸 스크립트 X) |
| 출력 | `hello world!\n` 등 **문자열 완전 일치** |
| `return 0` | C99+ `main` 에선 생략 가능 (필수는 아님) |

## ps — 프로세스 목록

### `ps aux`

| 글자 | 의미 |
|------|------|
| `a` | 다른 사용자 포함 |
| `u` | 상세(유저 형식) |
| `x` | 터미널 없는 프로세스도 |

```bash
ps aux | grep ps_test
```

**함정:** `grep --color=auto ps_test` 줄은 **grep 자신**.  
`ps_test` 프로세스가 아님. (`S+` = sleep + 포그라운드)

```bash
ps aux | grep '[p]s_test'    # grep 자신 제외
```

### `ps -el`

| 옵션 | 의미 |
|------|------|
| `-e` | 모든 프로세스 |
| `-l` | long (상태 열 `S`) |

```bash
ps -el | grep ps_pid_test
# 1 R  1001    91     1 ... ps_pid_test
#   ^ S 열 = Process State Code
```

실습 답 예: **`R`** (Running)

| 코드 | 의미 |
|------|------|
| **R** | Running |
| **S** | Interruptible sleep |
| **D** | Uninterruptible sleep |
| **T** | Stopped |
| **Z** | Zombie |

```bash
ps -C kill_test_proc -o pid,stat,cmd
ps -el | grep kill_test_proc
```

## kill — 종료

**PID 숫자**만 가능. 이름 넣으면 에러.

```text
$ kill kill_test_proc
-bash: kill: kill_test_proc: arguments must be process or job IDs
```

```bash
ps -el | grep kill_test_proc
# PID 174
kill 174
kill -9 174          # 강제
killall kill_test_proc
pkill kill_test_proc
```

| 시그널 | 의미 |
|--------|------|
| TERM (15) | 기본, 정상 종료 요청 |
| KILL (9) | 강제 종료 |

## 랩 세션 요약

```bash
gcc -o hello hello.c && ./hello
ps -el | grep ps_pid_test    # → R
ps -el | grep kill_test_proc # → PID
kill 174
```

## 다음에

[06-environment-variables.md](./06-environment-variables.md) · [07-file-descriptors.md](./07-file-descriptors.md)
