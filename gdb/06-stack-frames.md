# 6. 스택과 프레임

함수 호출마다 스택에 **프레임**이 쌓인다.  
버퍼 오버플로·반환 주소 변조를 이해하려면 이 구조를 본다.

## backtrace

```bash
(gdb) backtrace
(gdb) bt
(gdb) bt full          # 프레임별 지역 변수 포함 시도
```

호출 스택을 위에서(최근) 아래로(오래된 호출) 보여 준다.

## 프레임 이동

```bash
(gdb) frame 0          # 또는 f 0 — 현재(가장 안쪽)
(gdb) frame 2
(gdb) up
(gdb) down
(gdb) info frame
(gdb) info args
(gdb) info locals
```

## 스택 원시 덤프

```bash
(gdb) x/20gx $rsp
(gdb) x/20gx $rbp-0x40
```

관례적 프레임(프레임 포인터 사용 시, 개념도):

```text
높은 주소
  ...
  [ 이전 프레임 ]
  [ 반환 주소     ]  ← ret가 가져갈 값
  [ 저장된 RBP    ]  ← push rbp
  [ 지역 변수     ]  ← 버퍼 등
  ...
낮은 주소  ← RSP
```

오버플로는 지역 버퍼에서 **높은 주소 방향**으로 쓸 때 반환 주소를 덮을 수 있다.

## 반환 주소 확인

```bash
(gdb) x/gx $rsp          # 호출 직후 등 맥락 의존
(gdb) info frame         # "saved rip" 등
```

크래시 직후:

```bash
(gdb) bt
(gdb) x/i $rip           # 죽은 위치
(gdb) info registers
```

`RIP` 가 `0x41414141` 같은 값이면 반환 주소·함수 포인터가 공격 입력으로 덮였을 가능성이 있다.

## 인자 확인 (System V AMD64)

호출 직전·직후:

```bash
(gdb) p $rdi
(gdb) p $rsi
(gdb) x/s $rdi           # 인자0이 문자열 포인터일 때
```

## 주의

- `-O2` 이상이면 프레임 포인터 생략, 변수 레지스터 할당 → `info locals` 가 비거나 이상할 수 있음  
- 인라인된 함수는 프레임이 합쳐져 보일 수 있음  
- 학습용으로는 `-g -O0 -fno-omit-frame-pointer` 가 읽기 쉬움  
