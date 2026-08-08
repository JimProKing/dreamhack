# Exercise: GDB (#1908)

- 링크: https://dreamhack.io/wargame/challenges/1908
- 분류: Reversing / System · GDB 실습
- 바이너리: `main` (ELF x86-64, not stripped, No PIE)
- 원본 zip: `original.zip` (있을 때)
- 로컬 재현: `solve.py` (알고리즘 재구현)

## 한 줄 요약

`flag_1()` 반환값(RAX)과, 조건 우회 후 실행되는 `flag_2()` 출력값을 구해  
`DH{flag1-flag2}` 형태로 제출한다.

## 관찰

### 문자열

```text
Use debugging to find flag1 and flag2..
If you find flag1 and flag2, full flag is DH{flag1-flag2}
flag2 is 0x%lx
```

### `main` (요지)

```text
puts(안내)
call flag_1                 ; 반환값 = flag1 → 직후 RAX
movzx eax, byte ptr [a]     ; 전역 a (초기값 1) 로 RAX 덮음
test al, al
jne  skip
call flag_2                 ; a==0 일 때만 호출 → flag2 출력
skip:
puts(...)
```

| 주소 (이 빌드) | 의미 |
|----------------|------|
| `0x40116d` | `call flag_1` |
| `0x401172` | flag_1 직후 — **여기서 RAX = flag1** |
| `0x401179` | `test al, al` — 직전 movzx 로 `a` 로드됨 |
| `0x40117d` | `call flag_2` (분기 통과 시) |
| `0x404020` | 전역 `a` = `1` (기본은 flag_2 스킵) |

### 안티 디스어셈블

`flag_1` / `flag_2` 초입에:

```text
jmp  next_byte    ; eb ff  → 한 바이트 건너뛰어 선형 디스어셈을 어긋냄
```

선형 디스어셈(`objdump` 기본)은 garbage로 보이지만, **점프 목적지부터** 다시 맞추면 상수·루프가 보인다.

### 공통 연산 (flag_1 / flag_2)

초기 `x = 0` 후, `i = 0 .. N` (포함, `jle`) 동안:

```text
x = (x * mul)  mod 2^64     ; imul 하위 64비트
x = (x + add)  mod 2^64
x = x % mod                 ; div, rdx:rax 의 나머지
```

| | mod | mul | add | N (`jle` 즉시) |
|--|-----|-----|-----|----------------|
| flag_1 | `0xfabc0897fabc0897` | `0xca084213` | `0xdeadbeefcafecafe` | `0x63` (100회) |
| flag_2 | `0xfbbbbbbbbbbbbbbb` | `0xcacacacacaca` | `0xdeadbeafbeaf` | `0x60` (97회) |

`flag_2` 는 마지막에 `printf("flag2 is 0x%lx", x)`.

## 절차 A — GDB (의도된 풀이, Linux)

macOS에서는 이 ELF를 직접 실행할 수 없으므로 Linux/컨테이너에서:

```bash
chmod +x main
gdb -q ./main
```

```text
(gdb) set disassembly-flavor intel
(gdb) set pagination off
(gdb) disas main

# flag1: call flag_1 다음
(gdb) break *0x401172
(gdb) run
(gdb) p/x $rax
# → 0xc26ff5e224fb0d15

# flag2: test 직전/직후에서 a 또는 rax를 0으로
(gdb) break *0x401179
(gdb) continue
(gdb) set $rax = 0
# 또는: set {char}0x404020 = 0  후 해당 지점부터
(gdb) continue
# 출력: flag2 is 0xb81a07bc4181fe49
```

`finish` 대안 (flag1):

```text
(gdb) break flag_1
(gdb) run
(gdb) finish
(gdb) p/x $rax
```

## 절차 B — 정적 재구현 (이 환경에서 확정)

64비트 래핑을 반영한 모듈러 갱신:

```python
MASK = (1 << 64) - 1
x = 0
for _ in range(N + 1):
    x = (x * mul) & MASK
    x = (x + add) & MASK
    x = x % mod
```

```bash
python3 solve.py
```

출력:

```text
flag1 = 0xc26ff5e224fb0d15
flag2 = 0xb81a07bc4181fe49
DH{0xc26ff5e224fb0d15-0xb81a07bc4181fe49}
```

Unicorn으로 `flag_1` 진입~반환, `flag_2` 의 `printf` 인자(RSI)를 에뮬해 동일 값을 교차 확인했다.

## 왜 되는지

1. **flag1**은 ABI상 반환값이 RAX에 있으므로, `call flag_1` 직후(또는 `finish` 직후) RAX를 읽으면 된다.  
2. **flag2**는 전역 `a != 0` 이면 `jne` 으로 건너뛴다. GDB로 `rax`/`a` 를 0으로 만들면 `call flag_2` 가 실행되고, 루프 결과가 출력된다.  
3. 함수 본체는 의도적 오정렬로 정적 분석을 방해하지만, 점프 목적지부터 맞추거나 에뮬/재구현하면 상수·반복 횟수가 고정되어 값이 결정된다.  
4. Python에서 `% mod` 만 하고 중간을 임의정밀로 두면 CPU의 64비트 `imul`/`add` 와 달라진다 → **매 단계 `mod 2^64`** 가 필요하다.

## 제출 플래그

```text
DH{0xc26ff5e224fb0d15-0xb81a07bc4181fe49}
```

## 관련 노트

- [gdb/](../../gdb/) — 중단점, RAX, `set`, 디스어셈  
- [gdb/cheatsheet.md](../../gdb/cheatsheet.md)

## 파일

| 파일 | 설명 |
|------|------|
| `main` | 문제 바이너리 |
| `original.zip` | 드림핵 원본 (있을 때) |
| `solve.py` | 상수·루프 재구현으로 플래그 계산 |
| `README.md` | 이 문서 |
