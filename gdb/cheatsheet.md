# GDB 치트시트

## 세션

| 명령 | 의미 |
|------|------|
| `gdb ./prog` | 기동 |
| `gdb -p PID` | attach |
| `run` / `r` | 실행 |
| `set args ...` | 인자 |
| `quit` | 종료 |
| `attach` / `detach` | 연결·해제 |

## 중단

| 명령 | 의미 |
|------|------|
| `break` / `b` | 중단점 |
| `tbreak` | 1회용 |
| `info b` | 목록 |
| `delete N` | 삭제 |
| `disable` / `enable` | 비활성·활성 |
| `watch expr` | 쓰기 감시 |
| `condition N expr` | 조건 |

## 진행

| 명령 | 의미 |
|------|------|
| `c` | continue |
| `n` / `s` | next / step (소스) |
| `ni` / `si` | nexti / stepi (명령) |
| `finish` | 현재 함수 반환까지 |
| `Ctrl+C` | 실행 중 정지 |

## 관찰

| 명령 | 의미 |
|------|------|
| `p` / `print` | 식 출력 |
| `p/x` `p/d` `p/s` | 진법·문자열 |
| `i r` | 레지스터 |
| `x/16gx $rsp` | 메모리 |
| `x/10i $rip` | 명령 |
| `disassemble` | 디스어셈 |
| `bt` | 백트레이스 |
| `frame N` | 프레임 이동 |
| `info locals` | 지역 변수 |
| `info proc mappings` | 맵 |

## 변경

| 명령 | 의미 |
|------|------|
| `set var x=1` | 변수 |
| `set $rax=0` | 레지스터 |
| `set *addr=val` | 메모리 |
| `display/x $rax` | 매 정지 시 출력 |

## examine 형식

`x/[n][f][u] addr` — n개수, f형식(x/d/s/i…), u크기(b/h/w/g)

## 자주 쓰는 한 줄

```bash
set disassembly-flavor intel
set pagination off
b main
r
x/20gx $rsp
x/10i $rip
bt
```
