# Linux 101

[Dreamhack Path: Linux 101](https://dreamhack.io/lecture/paths/linux-101) 정리.

보안·시스템 분석을 하기 전에 **리눅스를 관찰하는 방법**을 한 바퀴 도는 코스입니다.  
유닛 노트 + Lab 연결 + 워게임 `baby-linux`.

상위 맵: [../README.md](../README.md)

---

## 유닛 목차

| # | 유닛 | 강의 | 노트 |
|---|------|------|------|
| 1 | 리눅스 환경 구축 | [environment-setup-for-linux](https://dreamhack.io/lecture/units/environment-setup-for-linux) | [01-environment-setup.md](./01-environment-setup.md) |
| 2 | 리눅스 사용 맛보기 | [a-quick-look-at-linux-usage](https://dreamhack.io/lecture/units/a-quick-look-at-linux-usage) | [02-quick-look.md](./02-quick-look.md) |
| 3 | 셸 (Shell) | [shell](https://dreamhack.io/lecture/units/shell) | [03-shell.md](./03-shell.md) |
| 4 | 파일과 디렉터리 | [files-and-directories](https://dreamhack.io/lecture/units/files-and-directories) | [04-files-and-directories.md](./04-files-and-directories.md) |
| 5 | 프로세스 | [processes](https://dreamhack.io/lecture/units/processes) | [05-processes.md](./05-processes.md) |
| 6 | 환경 변수 | [environment-variables](https://dreamhack.io/lecture/units/environment-variables) | [06-environment-variables.md](./06-environment-variables.md) |
| 7 | 파일 디스크립터 | [file-descriptors](https://dreamhack.io/lecture/units/file-descriptors) | [07-file-descriptors.md](./07-file-descriptors.md) |
| 8 | 사용자·그룹 | [users-groups](https://dreamhack.io/lecture/units/users-groups) | [08-users-groups.md](./08-users-groups.md) |

| 부가 | 링크 |
|------|------|
| 명령 치트시트 | [commands-cheatsheet.md](./commands-cheatsheet.md) |
| 워게임 baby-linux | [#837](https://dreamhack.io/wargame/challenges/837) → [../war_game/baby-linux_837](../war_game/baby-linux_837/) |
| 일자 로그 | [../log_for_study/2026-08-05.md](../log_for_study/2026-08-05.md) |

---

## 이 Path에서 잡는 것

| 주제 | 왜 필요한지 |
|------|-------------|
| 셸·경로 | 원격 셸·컨테이너 안에서 **어디를 보고 있는지** 고정 |
| 파일·권한·숨김 | 목록에 안 보이는 것, 읽기 가능 여부 판단 |
| 프로세스 | 상태 코드, 시그널, “누가 돌고 있는지” |
| fd · pipe · 리다이렉션 | 입출력이 **어디로 연결되는지** (필터·로그·파이프라인) |
| 사용자·그룹 | 권한 경계, 파일 소유 모델 |

시스템·웹·리버싱·포렌식 실습 대부분이 이 관찰 위에 올라갑니다.

---

## Lab / 실습 연결

| 실습 | 유닛 | 관찰 포인트 |
|------|------|-------------|
| Lab: File / Directory | 4 | `ls -al`, 숨김 파일, `mkdir` / `rmdir` |
| Lab: Process | 5 | ELF, `ps` 상태, `kill` |
| Lab: File Descriptor | 7 | fd 목록, pipe, `grep`, 리다이렉션 |
| baby-linux (#837) | 2+ | 단어 필터, 글로브, 출력에 가려진 문자열 |

---

## 추천 순서

1. 유닛 2–3 — 셸·기본 사용  
2. 유닛 4 + Lab — 파일·디렉터리  
3. 유닛 5 + Lab — 프로세스  
4. 유닛 7 + Lab — fd · pipe · grep  
5. baby-linux 워게임 — 필터·글로브·출력 채널  
6. 유닛 6 · 8 — 환경 변수 · 사용자  
7. 유닛 1 — 로컬 VM / WSL 환경 (필요 시)

각 노트에는 개념 요약과 Lab에서 확인한 명령을 같이 둡니다.
