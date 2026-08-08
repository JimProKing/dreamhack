# 5. 상태 관찰: 값·메모리·코드

## print / 표현식

```bash
(gdb) print variable
(gdb) p/x $rax          # 16진
(gdb) p/d $rax          # 부호 있는 10진
(gdb) p/u $rax          # 부호 없는 10진
(gdb) p/t $rax          # 이진
(gdb) p/c $al           # 문자
(gdb) p (char*)0x401000
(gdb) p *pointer
(gdb) p array[i]
```

GDB는 C에 가까운 표현식을 받는다. 레지스터는 `$rax`, `$rsp` 형태 (아키텍처별 이름).

## 레지스터

```bash
(gdb) info registers
(gdb) info registers rax rsp rip
(gdb) i r
```

x86-64에서 자주 보는 것:

| 레지스터 | 역할 (요약) |
|----------|-------------|
| RIP | 다음 명령 주소 |
| RSP | 스택 포인터 |
| RBP | 프레임 포인터(관례; 최적화 시 생략 가능) |
| RAX | 반환값·누산 |
| RDI, RSI, RDX, RCX, R8, R9 | 정수/포인터 인자 (System V AMD64 ABI) |

## 메모리 검사: `x` (examine)

```text
x/[개수][형식][크기] 주소
```

| 형식 | 의미 |
|------|------|
| `x` | hex |
| `d` | 부호 10진 |
| `u` | 무부호 10진 |
| `o` | 8진 |
| `t` | 이진 |
| `c` | 문자 |
| `s` | C 문자열 |
| `i` | 명령(디스어셈) |
| `f` | 부동소수 |

| 크기 | 의미 |
|------|------|
| `b` | 1 byte |
| `h` | 2 bytes |
| `w` | 4 bytes |
| `g` | 8 bytes |

예:

```bash
(gdb) x/16gx $rsp          # 스택 상단 16쿼드워드 hex
(gdb) x/32bx buf           # 버퍼 32바이트
(gdb) x/s 0x404000         # 문자열
(gdb) x/10i $rip           # 현재부터 명령 10개
```

## 디스어셈블

```bash
(gdb) disassemble
(gdb) disassemble main
(gdb) disassemble $rip, +0x40
(gdb) set disassembly-flavor intel
```

## 소스 문맥

```bash
(gdb) list
(gdb) list -
(gdb) list function
(gdb) info source
(gdb) info line *$rip
```

## 프로세스 맵

```bash
(gdb) info proc mappings
# 또는 셸에서
(gdb) shell cat /proc/$(pid)/maps
```

libc·스택·힙 주소 범위를 확인할 때. Linux 101의 메모리·프로세스 관찰과 동일 계열.

## 스레드

```bash
(gdb) info threads
(gdb) thread 2
```
