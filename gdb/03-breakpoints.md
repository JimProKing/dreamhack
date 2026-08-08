# 3. 중단점 (Breakpoints)

실행을 **의도한 위치**에서 멈추게 하는 것이 디버깅의 핵심이다.

## 주소·심볼·줄

```bash
(gdb) break main
(gdb) break demo.c:42
(gdb) break *0x401234
(gdb) b *main+0x20
```

| 형태 | 설명 |
|------|------|
| 함수 이름 | 심볼 있을 때. PLT/실제 구현 주의 |
| `파일:줄` | `-g` 빌드 시 |
| `*주소` | 심볼 없을 때·어셈 기준 |

## 목록·삭제·활성

```bash
(gdb) info breakpoints    # 또는 info b
(gdb) delete 2            # 번호로 삭제
(gdb) delete              # 전부
(gdb) disable 1
(gdb) enable 1
(gdb) clear main          # 해당 위치 중단점 제거
```

## 임시 중단점

```bash
(gdb) tbreak main         # 한 번 걸리면 자동 삭제
```

## 조건 중단점

```bash
(gdb) break foo if i == 10
(gdb) condition 1 i > 5   # 중단점 1번에 조건
```

루프 안에서 “특정 인덱스일 때만” 멈출 때 유용.

## 명령 연결

```bash
(gdb) break vuln
(gdb) commands
> silent
> x/20gx $rsp
> continue
> end
```

멈출 때마다 자동으로 스택을 찍고 다시 진행하는 식.

## Watchpoint (데이터 감시)

값이 **바뀔 때** 멈춤.

```bash
(gdb) watch variable
(gdb) watch *0x7fffffffde00
(gdb) rwatch ...          # 읽힐 때 (하드웨어 지원 시)
(gdb) awatch ...          # 읽기·쓰기
```

버퍼 오버플로로 인접 변수가 깨지는 순간을 잡을 때 쓴다.  
개수·아키텍처 제약이 있다 (하드웨어 watchpoint 한도).

## Catchpoint

```bash
(gdb) catch syscall write
(gdb) catch throw           # C++ 예외 등
```

## 하드웨어 vs 소프트웨어 중단점

| | 소프트웨어 | 하드웨어 |
|--|------------|----------|
| 원리 | 명령 바이트를 `int3` 등으로 교체 | CPU 디버그 레지스터 |
| 개수 | 사실상 많음 | 소량 (보통 4개 전후) |
| 비고 | 코드 쓰기 가능 영역 필요 | `hbreak` |

```bash
(gdb) hbreak *0x401234
```

## PIE·ASLR과 주소

매 `run` 마다 베이스가 바뀌면 절대 주소 중단점이 빗나간다.

```bash
(gdb) set disable-randomization on   # 기본인 경우 많음 (로컬 학습)
(gdb) info file                      # Entry, 로드 구간
(gdb) break *(&main)                 # 심볼 기준이 안전
```

원격·실제 익스플로잇 재현 시에는 ASLR을 켠 채로 **런타임 주소**를 다시 잡는다.
