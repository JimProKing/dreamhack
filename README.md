# dreamhack

[Dreamhack](https://dreamhack.io/) 강의·Path·워게임 공부 메모.

점수보다 **왜 되는지 / 어디서 막히는지** 를 적어 두는 쪽.  
시작: 2026-08-03

```text
log_for_study/   그날 뭐 했는지
linux_101/       리눅스 Path 정리 (여러 번 봄)
web_basics/      웹·쿠키·세션 정리
war_game/        문제별 폴더 (이름_번호/)
```

문제 폴더 예: `blue-whale_853/`, `baby-linux_837/`  
맵: [`war_game/README.md`](war_game/README.md)

적어 둘 때 대충 이렇게:

| 습관 | 의미 |
|------|------|
| 메커니즘 먼저 | 플래그보다 필터·레이어·권한·fd·쿼리가 어떻게 도는지 |
| 다시 칠 수 있게 | 명령·경로·조건을 남겨 둠 |
| 보고 → 추측 → 확인 | 추측만 쓰지 않고 출력·소스로 검증 |
| 스크립트는 도구 | 반복 작업은 코드, 이해는 문서 |

---

## 다루는 영역

```text
Linux 시스템 기초                          (linux_101 — Path 완료)
  └─ 셸 · 파일/권한 · 프로세스 · fd/pipe · 사용자
       │
       ├─ 원격 접속 · 네트워크 도구         (Netcat, SSH)
       ├─ 컨테이너 구조 · 아티팩트          (Docker 이미지/레이어)
       ├─ 입력 검증 · 필터 분석             (정규식, 웹 필터)
       ├─ 프로토콜 자동화                   (pwntools, 스크립트)
       │
       └─ 웹
            기초 · 인증 상태                 (web_basics)
            클라이언트: XSS · CSRF
            서버: File · SQLi · NoSQL · SSRF
```

| 영역 | 무엇을 보나 | 노트 / 문제 |
|------|-------------|-------------|
| **시스템 기초** | 경로, 권한, 프로세스, fd, 리다이렉션 | [`linux_101/`](linux_101/), [#837](https://dreamhack.io/wargame/challenges/837) |
| **웹 기초** | HTTP 요청·응답, 브라우저, DevTools | [`web_basics/`](web_basics/), [#267](https://dreamhack.io/wargame/challenges/267) |
| **인증 상태** | 쿠키·세션, 변조·신뢰 경계, SOP/CORS | [`web_basics/03`](web_basics/03-cookie-session.md)–[`04`](web_basics/04-sop-cors.md), [#6](https://dreamhack.io/wargame/challenges/6), [#409](https://dreamhack.io/wargame/challenges/409) |
| **클라이언트 웹** | XSS(봇·쿠키), CSRF(권한 요청) | [#28](https://dreamhack.io/wargame/challenges/28), [#268](https://dreamhack.io/wargame/challenges/268), [#26](https://dreamhack.io/wargame/challenges/26), [#269](https://dreamhack.io/wargame/challenges/269) · [log 08-07](log_for_study/2026-08-07.md) |
| **파일 취약** | 업로드 실행, 경로 조작 다운로드 | [#38](https://dreamhack.io/wargame/challenges/38), [#37](https://dreamhack.io/wargame/challenges/37) |
| **주입** | SQLi 따옴표, Blind, NoSQL `$regex` | [#24](https://dreamhack.io/wargame/challenges/24), [#90](https://dreamhack.io/wargame/challenges/90) |
| **SSRF** | 서버 대신 내부 URL·포트 | [#75](https://dreamhack.io/wargame/challenges/75) |
| **원격 상호작용** | TCP 접속, 원격 셸, 포트 매핑 | [#812](https://dreamhack.io/wargame/challenges/812), [#875](https://dreamhack.io/wargame/challenges/875) |
| **컨테이너** | 이미지 레이어, whiteout, 잔존 데이터 | [#876](https://dreamhack.io/wargame/challenges/876), [#853](https://dreamhack.io/wargame/challenges/853) |
| **입력 검증** | 정규식 분해, 필터 우회 조건 | [#834](https://dreamhack.io/wargame/challenges/834), [#873](https://dreamhack.io/wargame/challenges/873) |
| **자동화** | 반복 입출력, 시간 제약, 프로토콜 I/O | [#1114](https://dreamhack.io/wargame/challenges/1114), [#1874](https://dreamhack.io/wargame/challenges/1874) |

전체 문제 표: [`war_game/README.md`](war_game/README.md)

---

## 워게임 현황

| ID | 문제 | 영역 | 핵심 포인트 |
|----|------|------|-------------|
| [812](https://dreamhack.io/wargame/challenges/812) | welcome-beginners | Netcat | TCP 접속, 포트 해석 |
| [875](https://dreamhack.io/wargame/challenges/875) | exercise-ssh | SSH | 원격 셸 로그인 |
| [876](https://dreamhack.io/wargame/challenges/876) | exercise-docker | Docker | 로컬 빌드·실행 |
| [853](https://dreamhack.io/wargame/challenges/853) | blue-whale | Docker | 레이어 잔존, whiteout |
| [834](https://dreamhack.io/wargame/challenges/834) | ex-reg-ex | Regex | 패턴 분해·매칭 문자열 구성 |
| [873](https://dreamhack.io/wargame/challenges/873) | phpreg | Web / Regex | 필터 조건 분석, 명령 주입 경로 |
| [837](https://dreamhack.io/wargame/challenges/837) | baby-linux | Linux | 글로브, 출력 채널, 숨김 표현 |
| [1114](https://dreamhack.io/wargame/challenges/1114) | addition-quiz | Misc / pwn | 시간 제약 + 반복 응답 자동화 |
| [1874](https://dreamhack.io/wargame/challenges/1874) | flag-shop | Misc | 상태 추적 + 스크립트 자동화 |
| [267](https://dreamhack.io/wargame/challenges/267) | devtools-sources | Web / DevTools | Sources 패널 리소스 관찰 *(유닛 연계)* |
| [6](https://dreamhack.io/wargame/challenges/6) | cookie | Web / Cookie | 쿠키 인증·변조 *(유닛 연계)* |
| [409](https://dreamhack.io/wargame/challenges/409) | session-basic | Web / Session | 세션 + 쿠키 ID *(유닛 연계)* |
| [28](https://dreamhack.io/wargame/challenges/28) | xss-1 | XSS | 봇 쿠키 → memo |
| [268](https://dreamhack.io/wargame/challenges/268) | xss-2 | XSS | script 필터 → onerror |
| [38](https://dreamhack.io/wargame/challenges/38) | image-storage | File Upload | php 웹쉘 |
| [37](https://dreamhack.io/wargame/challenges/37) | file-download-1 | Path Traversal | `../flag.py` |
| [24](https://dreamhack.io/wargame/challenges/24) | simple_sqli | SQLi | `admin";--` (`"` 쿼리) |
| [26](https://dreamhack.io/wargame/challenges/26) | csrf-1 | CSRF | notice_flag → memo |
| [269](https://dreamhack.io/wargame/challenges/269) | csrf-2 | CSRF | change_password → 로그인 |
| [90](https://dreamhack.io/wargame/challenges/90) | Mango | NoSQL | `$regex` + dh 필터 우회 |
| [75](https://dreamhack.io/wargame/challenges/75) | web-ssrf | SSRF | `2130706433` + 포트 스캔 |

상세 정리: [log_for_study/2026-08-07.md](log_for_study/2026-08-07.md)

---

## 일자별 기록

| 날짜 | 요약 | 로그 |
|------|------|------|
| 2026-08-07 | XSS·File·SQLi·CSRF·NoSQL·SSRF 웹 취약점 | [log](log_for_study/2026-08-07.md) |
| 2026-08-06 | Linux 101 Path 완료, 웹 기초, Cookie·Session·SOP | [log](log_for_study/2026-08-06.md) |
| 2026-08-05 | Linux 101 Path, Lab(파일·프로세스·fd), baby-linux | [log](log_for_study/2026-08-05.md) |
| 2026-08-04 | Tips (nc/SSH/Docker/regex), 입문 워게임 6문제 | [log](log_for_study/2026-08-04.md) |
| 2026-08-03 | pwntools 기초, addition-quiz, flag-shop | [log](log_for_study/2026-08-03.md) |

---

## 기초 도구 치트시트

강의: [Tips make life easier](https://dreamhack.io/lecture/units/tips-make-life-easier)  
상세 정리: [log_for_study/2026-08-04.md](log_for_study/2026-08-04.md)

| 도구 | 한 줄 | 대표 사용 |
|------|--------|-----------|
| **Netcat** | TCP로 서비스에 붙기 | `ncat host port` |
| **SSH** | 암호화된 원격 셸 | `ssh user@host -p port` |
| **Docker** | 이미지·컨테이너·레이어 | `build` / `run` / `pull` |
| **정규식** | 패턴 검증·필터 표현 | `\w` `\d` `preg_*` / `re` |
| **pwntools** | 프로세스·소켓 I/O 자동화 | `remote()`, `recv*`, `sendline` |
| **DevTools** | 요청·쿠키·스크립트 관찰 | Network / Application / Sources |

```bash
# 접속
ncat host3.dreamhack.games PORT
ssh chall@host3.dreamhack.games -p PORT

# Docker
docker version                    # Server 줄 확인
docker build -t name .
docker run -it name /bin/bash
docker pull repo:tag

# 포트 A/tcp → B/tcp 이면 접속 포트는 A
# 웹 문제: 브라우저 http://host:port  + F12 DevTools
```

Linux 명령 요약: [`linux_101/commands-cheatsheet.md`](linux_101/commands-cheatsheet.md)  
웹 기초 맵: [`web_basics/README.md`](web_basics/README.md)

---

## 환경 설정

```bash
# Python 3.12 + venv
python3.12 -m venv venv
source venv/bin/activate          # Windows: venv\Scripts\activate
pip install -r requirements.txt

# 예: 자동화 스크립트
python war_game/addition-quiz_1114/solve.py
python war_game/flag-shop_1874/solve.py

# Docker 실습 (#876)
cd war_game/exercise-docker_876
docker build -t dreamhack-docker .
docker run -it dreamhack-docker /bin/bash

# 레이어 분석 (#853) — Windows 스크립트 예시
cd war_game/blue-whale_853
powershell -ExecutionPolicy Bypass -File .\start-docker.ps1
powershell -ExecutionPolicy Bypass -File .\solve.ps1
```

`solve.py` 의 `HOST` / `PORT` 는 서버 띄운 뒤 값으로 바꾸면 됨.

문제 폴더 README 에 있으면 좋은 것: 링크, 한 줄 요약, 관찰(필터·제약), 풀이 순서, 왜 되는지.

---

## 참고 링크

- [Dreamhack](https://dreamhack.io/) · [Wargame](https://dreamhack.io/wargame/)
- [Linux 101 Path](https://dreamhack.io/lecture/paths/linux-101)
- [웹 해킹을 위한 웹 기초 지식](https://dreamhack.io/lecture/units/webhacking-basic-knowledeges)
- [Cookie & Session](https://dreamhack.io/lecture/units/webhacking-cookie-session)
- [Tips make life easier](https://dreamhack.io/lecture/units/tips-make-life-easier)
- [정규표현식 강의 #461](https://learn.dreamhack.io/461)
- [pwntools 문서](https://docs.pwntools.com/)
