# 3. 리눅스 셸 (Shell)

- 강의: [Linux Shell](https://dreamhack.io/lecture/units/shell)
- Path: [Linux 101](https://dreamhack.io/lecture/paths/linux-101)

## 셸이란

**사용자 ↔ 커널** 사이 중개.  
키보드로 친 명령을 해석해 프로그램을 실행한다.

```text
사람  →  셸(bash 등)  →  커널  →  하드웨어/파일
```

## 자주 보는 셸

| 셸 | 특징 |
|----|------|
| **sh** | 전통적, 스크립트 호환용 |
| **bash** | 가장 흔함 (드림핵 랩 기본에 가깝) |
| **dash** | 가벼운 sh 계열 (일부 스크립트 기본) |
| **zsh** | 편의 기능 많음 (mac 기본 등) |

프롬프트 예: `dreamhack@linux-lab:~$`  
- 사용자@호스트:현재경로$

## 셸이 하는 일 (기초)

- 명령 실행: `ls`, `cat`, …
- **글로브** 확장: `*.txt` → 실제 파일 목록
- **변수**: `$HOME`, `$$` (셸 PID)
- **파이프·리다이렉션** (유닛 7과 연결)
- 스크립트: `.sh` 파일 실행

## 실습에서 쓴 것

```bash
$$          # 현재 셸 PID
echo $$
ls /proc/$$/fd
```

## 다음에

[04-files-and-directories.md](./04-files-and-directories.md)
