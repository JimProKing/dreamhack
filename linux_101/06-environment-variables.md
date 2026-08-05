# 6. 환경 변수

- 강의: [Linux Environment Variables](https://dreamhack.io/lecture/units/environment-variables)
- Path: [Linux 101](https://dreamhack.io/lecture/paths/linux-101)

## 환경 변수란

셸·프로그램이 공유해서 읽는 **이름=값** 설정.  
경로, 사용자 홈, 로케일 등이 여기 들어 있다.

## 자주 보는 변수

| 변수 | 의미 |
|------|------|
| `HOME` | 홈 디렉터리 |
| `USER` / `LOGNAME` | 사용자 이름 |
| `PATH` | 명령 찾을 디렉터리 목록 (`:` 구분) |
| `PWD` | 현재 디렉터리 |
| `SHELL` | 기본 셸 경로 |

## 기본 명령

```bash
echo $HOME
echo $PATH
env                 # 환경 변수 목록
printenv PATH

export MYVAR=hello  # 현재 셸(+자식)에 설정
echo $MYVAR
```

## 포인트

- `$이름` 으로 값 참조
- `PATH` 에 없는 디렉터리의 프로그램은 `./prog` 처럼 경로를 붙여 실행
- 보안: `PATH` 조작, 위험한 `LD_PRELOAD` 등은 이후 해킹 주제와 연결

## 다음에

[07-file-descriptors.md](./07-file-descriptors.md)
