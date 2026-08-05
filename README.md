# Dreamhack 공부

드림핵 강의랑 워게임 풀면서 정리하는 레포.

시작일: 2026-08-03

---

## 기초 팁 (Tips make life easier)

강의: [해킹 입문, 기초 팁](https://dreamhack.io/lecture/units/tips-make-life-easier)  
상세: [log_for_study/2026-08-04.md](log_for_study/2026-08-04.md) 의 **강의: Tips make life easier** 절

| 주제 | 한 줄 | 대표 명령 | 연결 문제 |
|------|--------|-----------|-----------|
| **Netcat** | TCP로 서버 접속 | `ncat host port` | [#812](https://dreamhack.io/wargame/challenges/812) |
| **SSH** | 원격 셸 로그인 | `ssh user@host -p port` | [#875](https://dreamhack.io/wargame/challenges/875) |
| **코딩** | 소스·스크립트 에디터 | VS Code, Vim | 전 문제 소스 읽기 |
| **Docker** | 이미지 / 컨테이너 / 레이어 | `build` `run` `pull` | [#876](https://dreamhack.io/wargame/challenges/876), [#853](https://dreamhack.io/wargame/challenges/853) |
| **정규표현식** | 패턴 검증·필터 | `\w` `\d` `preg_*` | [#834](https://dreamhack.io/wargame/challenges/834), [#873](https://dreamhack.io/wargame/challenges/873) |

### 치트시트

```bash
# Netcat (Windows: ncat)
ncat host3.dreamhack.games PORT

# SSH
ssh chall@host3.dreamhack.games -p PORT

# Docker (Desktop 실행 후 Server 확인)
docker version
docker build -t name .
docker run -it name /bin/bash
docker pull repo:tag

# 정규식 예 (#834)
# drabcdee1am@abc.com

# PHP 필터 우회 예 (#873)
# Nickname: dnnyangyang0310
# Password: 0@12319!+1+13
# Command:  cat ../dream/????.txt
```

포트 `A/tcp → B/tcp` → 접속은 **A**.  
웹 문제는 브라우저 `http://host:port`.

---

## 폴더 구조

```
.
├── war_game/                    # 문제별: 이름_번호/
│   ├── welcome-beginners_812/   # Netcat
│   ├── exercise-ssh_875/        # SSH
│   ├── exercise-docker_876/     # Docker 빌드
│   ├── blue-whale_853/          # Docker 레이어
│   ├── ex-reg-ex_834/           # Regex 맞춤
│   ├── phpreg_873/              # Regex 필터 우회
│   ├── baby-linux_837/          # 리눅스 명령 + glob 우회
│   ├── addition-quiz_1114/
│   └── flag-shop_1874/
└── log_for_study/
    ├── 2026-08-03.md
    ├── 2026-08-04.md
    └── 2026-08-05.md            # baby-linux + 리눅스 기본 명령
```

각 문제 폴더: `README.md`, `original.zip`(있을 때), 소스/스크립트.

---

## 일자별 공부

### 2026-08-05

- 워게임: [baby-linux (#837)](https://dreamhack.io/wargame/challenges/837) — `flag` 필터 + `cat path/*`
- 리눅스 기본 명령 (`ls`, `cd`, `cat`, glob 등)
- 자세한 메모: [log_for_study/2026-08-05.md](log_for_study/2026-08-05.md)

### 2026-08-04

- 강의: [Tips make life easier](https://dreamhack.io/lecture/units/tips-make-life-easier) — Netcat / SSH / 코딩 / Docker / 정규표현식  
- 강의: [정규표현식 #461](https://learn.dreamhack.io/461)
- 워게임: #812, #875, #876, #853, #834, #873
- 자세한 메모: [log_for_study/2026-08-04.md](log_for_study/2026-08-04.md)

### 2026-08-03

- pwntools 기본, addition-quiz (#1114), flag-shop (#1874)
- [log_for_study/2026-08-03.md](log_for_study/2026-08-03.md)

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
```

---

## 링크

- [Dreamhack](https://dreamhack.io/)
- [Wargame](https://dreamhack.io/wargame/)
- [Tips make life easier](https://dreamhack.io/lecture/units/tips-make-life-easier)
- [정규표현식 강의 #461](https://learn.dreamhack.io/461)
