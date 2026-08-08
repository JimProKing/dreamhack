# 2. 세션 시작과 실행

## 기동

```bash
gdb ./program
gdb -q ./program          # 배너 축소
gdb --args ./program a b  # 인자 포함 기동 준비
```

GDB 프롬프트: `(gdb)`

## 프로그램 실행

| 명령 | 의미 |
|------|------|
| `run` / `r` | 처음부터 실행 (중단점까지 또는 종료까지) |
| `run arg1 arg2` | 인자 전달 |
| `run < in.txt` | 표준 입력 리다이렉트 |
| `set args a b` | 이후 `run` 에 쓸 인자 고정 |
| `show args` | 현재 인자 확인 |

```bash
(gdb) set args 1234
(gdb) run
```

## 이미 떠 있는 프로세스에 붙기

```bash
gdb -p PID
# 또는
(gdb) attach PID
(gdb) detach
```

서버·데몬 분석 시 사용. 권한·ptrace 정책에 막힐 수 있다.

## core 덤프

비정상 종료 후:

```bash
gdb ./program core
```

크래시 시점 레지스터·스택을 사후 분석할 때 쓴다.  
(`ulimit -c`, 시스템 core_pattern 설정이 필요)

## 종료

| 명령 | 의미 |
|------|------|
| `quit` / `q` | GDB 종료 |
| `kill` | 디버깅 중인 프로세스만 종료 |
| `Ctrl+C` | 실행 중이면 프로세스에 시그널 → GDB로 제어 복귀 |

## 편의 설정 (세션 초반)

```bash
(gdb) set disassembly-flavor intel   # AT&T 대신 Intel 문법 (선호 시)
(gdb) set pagination off             # 긴 출력 시 --More-- 끄기
(gdb) set confirm off
```

설정 파일 `~/.gdbinit` 에 넣어 두면 매 세션 적용.

## TUI (선택)

```bash
gdb -tui ./program
# 또는 세션 중
(gdb) layout asm
(gdb) layout reg
(gdb) layout split
```

어셈·레지스터를 화면에 고정해 둔다. 터미널 크기에 민감할 수 있다.
