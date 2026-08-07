# dreamhack

[![Python](https://img.shields.io/badge/Python-3.12-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![pwntools](https://img.shields.io/badge/pwntools-ready-black?logo=gnubash&logoColor=white)](https://docs.pwntools.com/)
[![Platform](https://img.shields.io/badge/Dreamhack-wargame-6C5CE7)](https://dreamhack.io/wargame/)
[![Started](https://img.shields.io/badge/start-2026--08--03-2d3436)](#일자별-기록)

[Dreamhack](https://dreamhack.io/) 강의·Path·워게임 공부 메모.

점수보다 **왜 되는지 / 어디서 막히는지** 를 적어 두는 쪽.

---

## 폴더

```text
📁 log_for_study/   그날 뭐 했는지
🐧 linux_101/       리눅스 Path 정리 (여러 번 봄)
🌐 web_basics/      웹·쿠키·세션 정리
🚩 war_game/        문제별 폴더 (이름_번호/)
```

문제 폴더 예: `blue-whale_853/`, `baby-linux_837/`  
전체 맵 → [`war_game/README.md`](war_game/README.md)

적어 둘 때:

| | 습관 | 의미 |
|--|------|------|
| ⚙️ | 메커니즘 먼저 | 플래그보다 필터·레이어·권한·fd·쿼리가 어떻게 도는지 |
| 🔁 | 다시 칠 수 있게 | 명령·경로·조건을 남겨 둠 |
| 👀 | 보고 → 추측 → 확인 | 추측만 쓰지 않고 출력·소스로 검증 |
| 🛠️ | 스크립트는 도구 | 반복 작업은 코드, 이해는 문서 |

---

## 다루는 영역

```text
🐧 Linux 시스템 기초                    (linux_101 — Path 완료)
  └─ 셸 · 파일/권한 · 프로세스 · fd/pipe · 사용자
       │
       ├─ 🔌 원격 접속 · 네트워크         (Netcat, SSH)
       ├─ 🐳 컨테이너 · 아티팩트          (Docker 이미지/레이어)
       ├─ 🔤 입력 검증 · 필터             (정규식, 웹 필터)
       ├─ ⚡ 프로토콜 자동화              (pwntools, 스크립트)
       │
       └─ 🌐 웹
            기초 · 인증                   (web_basics)
            클라이언트: XSS · CSRF
            서버: File · SQLi · NoSQL · SSRF
```

| | 영역 | 무엇을 보나 | 노트 / 문제 |
|--|------|-------------|-------------|
| 🐧 | **시스템 기초** | 경로, 권한, 프로세스, fd | [`linux_101/`](linux_101/), [#837](https://dreamhack.io/wargame/challenges/837) |
| 🌐 | **웹 기초** | HTTP, 브라우저, DevTools | [`web_basics/`](web_basics/), [#267](https://dreamhack.io/wargame/challenges/267) |
| 🍪 | **인증 상태** | 쿠키·세션, SOP/CORS | [`web_basics/03`](web_basics/03-cookie-session.md)–[`04`](web_basics/04-sop-cors.md) |
| 💉 | **클라이언트 웹** | XSS, CSRF | [#28](https://dreamhack.io/wargame/challenges/28) [#268](https://dreamhack.io/wargame/challenges/268) [#26](https://dreamhack.io/wargame/challenges/26) [#269](https://dreamhack.io/wargame/challenges/269) |
| 📂 | **파일 취약** | 업로드 실행, `../` 다운로드 | [#38](https://dreamhack.io/wargame/challenges/38) [#37](https://dreamhack.io/wargame/challenges/37) |
| 🧬 | **주입** | SQLi, Blind, NoSQL `$regex` | [#24](https://dreamhack.io/wargame/challenges/24) [#90](https://dreamhack.io/wargame/challenges/90) |
| 📡 | **SSRF** | 서버 대신 내부 URL·포트 | [#75](https://dreamhack.io/wargame/challenges/75) |
| 🔌 | **원격** | TCP, SSH | [#812](https://dreamhack.io/wargame/challenges/812) [#875](https://dreamhack.io/wargame/challenges/875) |
| 🐳 | **컨테이너** | 레이어, whiteout | [#876](https://dreamhack.io/wargame/challenges/876) [#853](https://dreamhack.io/wargame/challenges/853) |
| 🔤 | **정규식** | 패턴·필터 우회 | [#834](https://dreamhack.io/wargame/challenges/834) [#873](https://dreamhack.io/wargame/challenges/873) |
| ⚡ | **자동화** | 시간 제약 I/O | [#1114](https://dreamhack.io/wargame/challenges/1114) [#1874](https://dreamhack.io/wargame/challenges/1874) |

---

## 워게임

| ID | 문제 | 영역 | 핵심 |
|----|------|------|------|
| [812](https://dreamhack.io/wargame/challenges/812) | welcome-beginners | 🔌 Netcat | TCP 접속, 포트 |
| [875](https://dreamhack.io/wargame/challenges/875) | exercise-ssh | 🔌 SSH | 원격 셸 |
| [876](https://dreamhack.io/wargame/challenges/876) | exercise-docker | 🐳 Docker | 로컬 빌드·실행 |
| [853](https://dreamhack.io/wargame/challenges/853) | blue-whale | 🐳 Docker | 레이어 잔존, whiteout |
| [834](https://dreamhack.io/wargame/challenges/834) | ex-reg-ex | 🔤 Regex | 패턴 분해 |
| [873](https://dreamhack.io/wargame/challenges/873) | phpreg | 🔤 Web | 필터 우회, 명령 경로 |
| [837](https://dreamhack.io/wargame/challenges/837) | baby-linux | 🐧 Linux | 글로브, 출력 채널 |
| [1114](https://dreamhack.io/wargame/challenges/1114) | addition-quiz | ⚡ Misc | 시간 제약 자동화 |
| [1874](https://dreamhack.io/wargame/challenges/1874) | flag-shop | ⚡ Misc | 상태 추적 자동화 |
| [267](https://dreamhack.io/wargame/challenges/267) | devtools-sources | 🌐 DevTools | Sources |
| [6](https://dreamhack.io/wargame/challenges/6) | cookie | 🍪 Cookie | 쿠키 변조 |
| [409](https://dreamhack.io/wargame/challenges/409) | session-basic | 🍪 Session | 세션 + 쿠키 ID |
| [28](https://dreamhack.io/wargame/challenges/28) | xss-1 | 💉 XSS | 봇 쿠키 → memo |
| [268](https://dreamhack.io/wargame/challenges/268) | xss-2 | 💉 XSS | onerror |
| [38](https://dreamhack.io/wargame/challenges/38) | image-storage | 📂 Upload | php 웹쉘 |
| [37](https://dreamhack.io/wargame/challenges/37) | file-download-1 | 📂 Path | `../flag.py` |
| [24](https://dreamhack.io/wargame/challenges/24) | simple_sqli | 🧬 SQLi | `admin";--` |
| [26](https://dreamhack.io/wargame/challenges/26) | csrf-1 | 💉 CSRF | notice_flag → memo |
| [269](https://dreamhack.io/wargame/challenges/269) | csrf-2 | 💉 CSRF | 비번 변경 → 로그인 |
| [90](https://dreamhack.io/wargame/challenges/90) | Mango | 🧬 NoSQL | `$regex` + 필터 |
| [75](https://dreamhack.io/wargame/challenges/75) | web-ssrf | 📡 SSRF | `2130706433` + 포트 |

웹 취약 정리 → [log_for_study/2026-08-07.md](log_for_study/2026-08-07.md)

---

## 일자별 기록

| 날짜 | 요약 | |
|------|------|--|
| 2026-08-07 | XSS·File·SQLi·CSRF·NoSQL·SSRF | [log](log_for_study/2026-08-07.md) |
| 2026-08-06 | Linux 101 완료, 웹 기초, Cookie·Session | [log](log_for_study/2026-08-06.md) |
| 2026-08-05 | Linux Lab, baby-linux | [log](log_for_study/2026-08-05.md) |
| 2026-08-04 | Tips (nc/SSH/Docker/regex) | [log](log_for_study/2026-08-04.md) |
| 2026-08-03 | pwntools, addition-quiz, flag-shop | [log](log_for_study/2026-08-03.md) |

---

## 도구 치트시트

[Tips make life easier](https://dreamhack.io/lecture/units/tips-make-life-easier) · [상세](log_for_study/2026-08-04.md)

| | 도구 | 한 줄 | 예 |
|--|------|--------|-----|
| 🔌 | **Netcat** | TCP로 붙기 | `ncat host port` |
| 🔑 | **SSH** | 원격 셸 | `ssh user@host -p port` |
| 🐳 | **Docker** | 이미지·레이어 | `build` / `run` / `pull` |
| 🔤 | **정규식** | 패턴·필터 | `\w` `\d` |
| ⚡ | **pwntools** | 소켓 I/O | `remote()`, `sendline` |
| 🧰 | **DevTools** | 요청·쿠키·JS | Network / Application / Sources |

```bash
ncat host3.dreamhack.games PORT
ssh chall@host3.dreamhack.games -p PORT

docker version
docker build -t name .
docker run -it name /bin/bash

# 포트 A/tcp → B/tcp 이면 접속은 A
# 웹: http://host:port  + F12
```

🐧 [linux_101/commands-cheatsheet.md](linux_101/commands-cheatsheet.md) · 🌐 [web_basics/](web_basics/README.md)

---

## 환경

```bash
python3.12 -m venv venv
source venv/bin/activate          # Windows: venv\Scripts\activate
pip install -r requirements.txt

python war_game/addition-quiz_1114/solve.py
python war_game/flag-shop_1874/solve.py

cd war_game/exercise-docker_876
docker build -t dreamhack-docker .
docker run -it dreamhack-docker /bin/bash
```

`solve.py` 의 `HOST` / `PORT` 는 서버 띄운 뒤 값으로 바꾸면 됨.

문제 README 에 있으면 좋은 것: 링크, 한 줄 요약, 관찰, 풀이 순서, 왜 되는지.

---

## 링크

- 🏠 [Dreamhack](https://dreamhack.io/) · 🚩 [Wargame](https://dreamhack.io/wargame/)
- 🐧 [Linux 101 Path](https://dreamhack.io/lecture/paths/linux-101)
- 🌐 [웹 기초 지식](https://dreamhack.io/lecture/units/webhacking-basic-knowledeges)
- 🍪 [Cookie & Session](https://dreamhack.io/lecture/units/webhacking-cookie-session)
- 💡 [Tips make life easier](https://dreamhack.io/lecture/units/tips-make-life-easier)
- 🔤 [정규표현식 #461](https://learn.dreamhack.io/461)
- ⚡ [pwntools docs](https://docs.pwntools.com/)
