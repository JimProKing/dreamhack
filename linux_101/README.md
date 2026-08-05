# Linux 101

드림핵 Path 정리: [Linux 101](https://dreamhack.io/lecture/paths/linux-101)

보안 공부 전에 리눅스 기초를 잡는 코스.  
유닛 8개 + Lab + 워게임 `baby-linux`.

---

## Path 한눈에

| # | 유닛 | 링크 | 이 폴더 |
|---|------|------|---------|
| 1 | 리눅스 환경 구축 | [environment-setup-for-linux](https://dreamhack.io/lecture/units/environment-setup-for-linux) | [01-environment-setup.md](./01-environment-setup.md) |
| 2 | 리눅스 사용 맛보기 | [a-quick-look-at-linux-usage](https://dreamhack.io/lecture/units/a-quick-look-at-linux-usage) | [02-quick-look.md](./02-quick-look.md) |
| 3 | 셸 (Shell) | [shell](https://dreamhack.io/lecture/units/shell) | [03-shell.md](./03-shell.md) |
| 4 | 파일과 디렉터리 | [files-and-directories](https://dreamhack.io/lecture/units/files-and-directories) | [04-files-and-directories.md](./04-files-and-directories.md) |
| 5 | 프로세스 | [processes](https://dreamhack.io/lecture/units/processes) | [05-processes.md](./05-processes.md) |
| 6 | 환경 변수 | [environment-variables](https://dreamhack.io/lecture/units/environment-variables) | [06-environment-variables.md](./06-environment-variables.md) |
| 7 | 파일 디스크립터 | [file-descriptors](https://dreamhack.io/lecture/units/file-descriptors) | [07-file-descriptors.md](./07-file-descriptors.md) |
| 8 | 사용자·그룹 | [users-groups](https://dreamhack.io/lecture/units/users-groups) | [08-users-groups.md](./08-users-groups.md) |

**워게임:** [baby-linux (#837)](https://dreamhack.io/wargame/challenges/837) → [war_game/baby-linux_837](../war_game/baby-linux_837/)  
**명령 모아보기:** [commands-cheatsheet.md](./commands-cheatsheet.md)

---

## 왜 배우나

- 시스템·웹·리버싱·포렌식 대부분이 **리눅스** 위
- 보안 도구도 리눅스 기준이 많음
- 이 Path: 환경 구축 → 셸 → 파일 → 프로세스 → 권한·fd 까지 **기초 한 바퀴**

---

## 공부한 Lab / 실습 연결

| 실습 | 관련 유닛 | 메모 |
|------|-----------|------|
| Lab: File / Directory | 4 | `ls -al`, 숨김 파일, `mkdir`/`rmdir` |
| Lab: Process | 5 | ELF `hello`, `ps`, `kill` |
| Lab: File Descriptor | 7 | fd 개수, pipe, grep, 리다이렉션 |
| baby-linux | 2 | `flag` 필터 + glob / `tail` |

일자 로그: [log_for_study/2026-08-05.md](../log_for_study/2026-08-05.md)

---

## 읽는 순서 (추천)

1. 유닛 2~3 (셸·기본 사용)  
2. 유닛 4 (파일·디렉터리) + Lab  
3. 유닛 5 (프로세스) + Lab  
4. 유닛 7 (fd·pipe·grep) + Lab  
5. baby-linux 워게임  
6. 유닛 6·8 (환경변수·유저)  
7. 유닛 1 (로컬 VM/WSL 환경 — 필요 시)
