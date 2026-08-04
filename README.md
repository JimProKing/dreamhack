# Dreamhack 공부

드림핵 강의랑 워게임 풀면서 정리하는 레포.

시작일: 2026-08-03

---

## 폴더 구조

```
.
├── war_game/                    # 문제별: 이름_번호/
│   ├── welcome-beginners_812/
│   ├── exercise-ssh_875/
│   ├── exercise-docker_876/
│   ├── blue-whale_853/
│   ├── ex-reg-ex_834/
│   ├── phpreg_873/
│   ├── addition-quiz_1114/
│   └── flag-shop_1874/
└── log_for_study/               # 날짜별 공부 정리
```

각 문제 폴더 관례:

- `README.md` — 풀이 요약
- `original.zip` — 드림핵에서 받은 원본 (있을 때)
- 소스 / 스크립트 — 문제 유형에 따라

---

## 일자별 공부

### 2026-08-04

- 이 노트북으로 레포 이전 후 이어서 공부
- 강의
  - [정규표현식 (learn #461)](https://learn.dreamhack.io/461) — 메타문자, 수량자, `re` 모듈
- 워게임
  - Welcome-Beginners (#812) — `ncat` → `Dreamhack` 입력
  - Exercise: SSH (#875) — OpenSSH → `cat flag`
  - Exercise: Docker (#876) — 로컬 `docker build` / `run`
  - blue-whale (#853) — Hub 이미지 레이어 분석
  - ex-reg-ex (#834) — 정규식에 맞는 문자열 입력
  - phpreg (#873) — PHP 필터 우회 → `system()` + 와일드카드
- `war_game/` 정리 (`이름_번호/`, `original.zip`)
- 자세한 메모: [log_for_study/2026-08-04.md](log_for_study/2026-08-04.md)

### 2026-08-03

- pwntools 기본 사용법 정리
- 워게임: addition-quiz (#1114), flag-shop (#1874)
- 자세한 메모: [log_for_study/2026-08-03.md](log_for_study/2026-08-03.md)

---

## 실행 방법

```bash
# 가상환경 (처음 한 번)
python3.12 -m venv venv
source venv/bin/activate   # Windows: venv\Scripts\activate
pip install pwntools

python war_game/addition-quiz_1114/solve.py
python war_game/flag-shop_1874/solve.py

# Docker (#876)
cd war_game/exercise-docker_876
docker build -t dreamhack-docker .
docker run -it dreamhack-docker /bin/bash

# blue-whale (#853)
cd war_game/blue-whale_853
powershell -ExecutionPolicy Bypass -File .\start-docker.ps1
powershell -ExecutionPolicy Bypass -File .\solve.ps1

# ex-reg-ex (#834) — 예: drabcdee1am@abc.com  (드림핵 웹 서버)
# phpreg (#873) — Nickname dnnyangyang0310 / Password 0@12319!+1+13
#                 Command: cat ../dream/????.txt
```

---

## 링크

- [Dreamhack](https://dreamhack.io/)
- [Wargame](https://dreamhack.io/wargame/)
- [정규표현식 강의 #461](https://learn.dreamhack.io/461)
