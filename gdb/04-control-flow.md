# 4. 실행 제어

중단 이후 **한 걸음씩** 또는 **다음 중단점까지** 진행한다.

## 기본

| 명령 | 단축 | 의미 |
|------|------|------|
| `continue` | `c` | 다음 중단점·시그널·종료까지 계속 |
| `next` | `n` | **소스 한 줄** 실행. 함수 호출은 통째로 넘어감 |
| `step` | `s` | 소스 한 줄. 함수 **안으로** 들어감 |
| `nexti` | `ni` | **기계어 한 명령**. call은 안으로 안 들어감 |
| `stepi` | `si` | 기계어 한 명령. call 안으로 들어감 |
| `finish` | | 현재 함수가 반환할 때까지 실행 후 멈춤 |
| `until` | | 현재 줄보다 아래(또는 지정 위치)까지 |
| `advance 위치` | | 지정 위치까지 실행 후 멈춤 |

## 소스 vs 어셈

| 상황 | 권장 |
|------|------|
| `-g` 있고 로직 추적 | `n` / `s` |
| 심볼 없음·최적화·익스플로잇 | `ni` / `si` + `disassemble` |
| 라이브러리 호출만 건너뛰기 | `n` 또는 `finish` |

`step` 이 libc 안으로 깊게 들어가면 `finish` 로 빠져나온다.

## 반복

```bash
(gdb) si 10          # stepi 10회
(gdb) n 5
```

## 시그널

```bash
(gdb) info signals
(gdb) handle SIGALRM ignore
(gdb) handle SIGSEGV stop print
```

크래시(`SIGSEGV`) 시 기본은 멈추고 상태 확인 가능.  
alarm·timeout이 있는 워게임에서는 시그널 처리를 바꿔 관찰을 편하게 할 수 있다.

## reverse (지원 빌드·환경에서)

```bash
(gdb) record
(gdb) reverse-stepi
(gdb) reverse-continue
```

항상 가능하지는 않다. 기록 모드 오버헤드·제한 있음.

## 전형적인 루틴

```text
break main (또는 관심 함수)
run
# 상태 확인
si / ni 로 의심 구간 진행
# 또는
continue 로 다음 중단점
```
