# GDB (GNU Debugger)

프로세스 실행을 **멈추고**, 그 순간의 **레지스터·메모리·스택·코드**를 관찰·변경하는 디버거.

시스템 해킹·리버싱에서 바이너리가 “지금 무엇을 하고 있는지”를 확인하는 기본 도구.  
드림핵 System Hacking 계열 유닛([Tool: gdb](https://dreamhack.io/lecture) 등)과 같이 쓰는 것을 전제로 정리.

| # | 노트 | 내용 |
|---|------|------|
| 1 | [01-overview.md](./01-overview.md) | 디버거가 하는 일, 컴파일 옵션, 프로세스 모델 |
| 2 | [02-session.md](./02-session.md) | 기동, run/attach, 인자·입출력 |
| 3 | [03-breakpoints.md](./03-breakpoints.md) | 중단점, watch, catch |
| 4 | [04-control-flow.md](./04-control-flow.md) | continue, step, next, finish, until |
| 5 | [05-inspect.md](./05-inspect.md) | print, x, registers, disassemble |
| 6 | [06-stack-frames.md](./06-stack-frames.md) | backtrace, frame, 지역 변수 |
| 7 | [07-modify.md](./07-modify.md) | set, 패치, 조건 분기 실험 |
| 8 | [08-exploit-context.md](./08-exploit-context.md) | 익스플로잇·pwntools와 같이 쓸 때 |
| — | [cheatsheet.md](./cheatsheet.md) | 명령 빠른 참조 |

상위: [../README.md](../README.md) · [../lecture/README.md](../lecture/README.md) · [../linux_101/](../linux_101/)

---

## 한 줄 지도

```text
빌드 (-g) → gdb ./prog → break → run
                │
                ├─ 멈춤: 레지스터 / 메모리 / 스택 확인
                ├─ 한 줄·한 명령 진행 (n / s / si)
                └─ 필요 시 값 수정 후 continue
```
