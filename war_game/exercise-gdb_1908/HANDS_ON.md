# Exercise: GDB — 직접 해보기

목표: GDB로 `flag1`, `flag2` 를 읽고  
`DH{flag1-flag2}` 를 만든다.

바이너리는 **Linux x86-64** 이라 macOS에서 바로 안 돌아간다.  
아래는 **Docker 안 GDB** 기준이다.

---

## 0. 추천: 단계별 마법사

```bash
cd /Users/chan/Desktop/dreamhack/war_game/exercise-gdb_1908
./go.sh
```

메뉴:

| 키 | 내용 |
|----|------|
| `0` | Docker·이미지 준비 |
| `1` | main 디스어셈 보기 |
| `2` | flag1 자동 구하기 |
| `3` | flag2 조건 설명 |
| `4` | flag2 우회 후 구하기 |
| `5` | 직접 `(gdb)` 치기 |
| `a` | 0→4 한 번에 |
| `q` | 종료 |

**GDB 명령은 메뉴가 연 세션 안에서만.**  
Mac 프롬프트 `chan$` 에 `break` 치면 안 된다.

### Docker 켜기 (한 번)

```bash
open -a "Docker"
# 안정될 때까지 기다린 뒤
docker info
```

`./go.sh` 첫 실행 시 GDB 이미지 빌드(1~3분).

---

## 1. 기본 설정

`(gdb)` 에 그대로 입력:

```text
set disassembly-flavor intel
set pagination off
```

---

## 2. main 구조 보기

```text
disas main
```

확인할 것:

| 보이는 것 | 의미 |
|-----------|------|
| `call flag_1` | flag1 계산 함수 |
| 그 **다음 줄 주소** | 반환값이 RAX에 있는 순간 |
| `movzx eax, BYTE PTR [rip+...]` | 전역 `a` 를 RAX에 넣음 (flag1 덮어씀) |
| `test al, al` / `jne` | `a != 0` 이면 `flag_2` 스킵 |
| `call flag_2` | flag2 출력 함수 |

이 빌드 기준 주소 (다르면 `disas` 결과 우선):

```text
call flag_1     → 0x40116d
직후            → 0x401172   ← flag1 읽을 곳
test al, al     → 0x401179
call flag_2     → 0x40117d
```

---

## 3. flag1 구하기

```text
break *0x401172
run
```

멈추면:

```text
info registers rax
p/x $rax
```

나온 16진수가 **flag1**.  
메모장에 적어 둔다. (예: `0xc26ff5e224fb0d15` 형태)

### 다른 방법 (같은 값)

```text
delete
break flag_1
run
finish
p/x $rax
```

`finish` = 함수 끝까지 실행한 뒤 반환 직후에서 멈춤.

---

## 4. flag2 구하기 (조건 우회)

지금 프로세스는 이미 `run` 한 상태일 수 있다.  
처음부터 다시:

```text
delete
break *0x401179
run
```

`test al, al` 에서 멈춘다. 확인:

```text
p/x $rax
```

전역 `a` 가 1이면 RAX 하위가 0이 아니다 → 원래는 `flag_2` 를 안 탄다.

우회:

```text
set $rax = 0
continue
```

화면에 비슷한 출력이 나온다:

```text
flag2 is 0x................
```

그 숫자가 **flag2**.

### 우회 대안

```text
set {char}0x404020 = 0
```

(`a` 심볼 주소. `info address a` 로 확인 가능)  
그다음 `test` 전에 멈추고 `continue`.

---

## 5. 제출 형식

```text
DH{flag1-flag2}
```

문제 안내 문자열:

```text
If you find flag1 and flag2, full flag is DH{flag1-flag2}
```

`0x` 를 붙인 채 쓰는 경우가 많다. 드림핵 제출 칸 형식에 맞출 것.

예시 형태 (본인 GDB 값으로 치환):

```text
DH{0x................-0x................}
```

---

## 6. 막히면

| 증상 | 할 일 |
|------|--------|
| `run_gdb.sh` Docker 오류 | Desktop 앱 켠 뒤 `docker info` |
| `cannot execute` (호스트에서 ./main) | Mac이 아니라 Docker 안 gdb 사용 |
| break 주소에 안 멈춤 | `disas main` 으로 주소 다시 확인 |
| flag2 출력 없음 | `set $rax = 0` 을 **test 직후 멈춘 상태**에서 했는지 |
| 종료해 버림 | `run` 다시, break 다시 설정 |

GDB 종료:

```text
quit
```

---

## 7. 이해 체크 (답 안 보고)

1. 왜 `call flag_1` **다음**에서 RAX를 읽나?  
2. 왜 `run` 만 하면 flag2 가 안 나오나?  
3. `set $rax = 0` 이 `jne` 과 무슨 관계인가?

(답은 같은 폴더 `README.md` 의 「왜 되는지」.)

---

## 명령 치트 (이 문제용)

```text
disas main
break *0x401172
run
p/x $rax

delete
break *0x401179
run
set $rax = 0
continue
```

더 많은 명령: [../../gdb/cheatsheet.md](../../gdb/cheatsheet.md)
