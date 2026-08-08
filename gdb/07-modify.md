# 7. 실행 중 상태 변경

관찰만이 아니라 **값을 바꿔** “이렇게 되면 분기하나?” 를 실험할 수 있다.

## 변수·레지스터

```bash
(gdb) set variable i = 10
(gdb) set $rax = 0
(gdb) set $rip = 0x401200      # 위험: 흐름 자체를 바꿈
(gdb) set *((int *)0x7fffffffde00) = 0x1234
```

## 메모리 일괄

```bash
(gdb) set {char[8]}addr = {0x41,0x41,...}
# 또는
(gdb) call memset(buf, 0, 64)
```

`call` 은 디버gee 안에서 함수를 호출한다. 상태·락·힙을 건드릴 수 있어 신중히.

## 점프

```bash
(gdb) jump *0x401234
(gdb) jump label
```

다음 `continue`/`si` 없이 실행 위치를 옮긴다. 스택과 안 맞으면 즉시 크래시할 수 있다.

## 실용 예

| 목적 | 방법 |
|------|------|
| 인증 분기 우회 실험 | 비교 직전 레지스터/`zf` 관련 값 변경 또는 다른 경로로 jump |
| 카나리·길이 확인 | 루프 카운터를 줄여 조기 탈출 |
| 포인터 NULL 여부 | `set var p = 0` 후 진행 |

익스플로잇 최종 페이로드 검증이 아니라, **취약 조건이 성립하는 경로**를 찾는 단계에 가깝다.

## 디스플레이 (자동 출력)

```bash
(gdb) display/x $rax
(gdb) display/i $rip
(gdb) info display
(gdb) undisplay 1
```

매 멈춤마다 지정 식을 출력한다. `si` 루프에 유용.
