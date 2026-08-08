# dreamhack

[Dreamhack](https://dreamhack.io/) 강의, Path, 워게임 학습 기록.

점수나 완료 여부보다 **동작 원리와 재현 절차**—왜 성립하는지, 어디서 막히는지, 어떻게 검증하는지—를 남긴다.

시작: 2026-08-03

---

## 구성

```text
lecture/                 Learn 지도 (Path·진도·추천 순서)
log_for_study/           일자별 학습 기록
linux_101/               Linux 101 Path
web_basics/              웹, 쿠키, 세션, SOP/CORS
web_hacking/             웹 취약 유형 (XSS, CSRF, 파일, 주입, SSRF)
security_awareness/      Security Awareness Training Path
war_game/                문제 단위 자료 ({이름}_{번호}/)
requirements.txt         Python 의존성
```

강의 전체 맵: [lecture/README.md](lecture/README.md)  
문제 디렉터리 명명: `{slug}_{id}/` (예: `blue-whale_853/`). 목록: [war_game/README.md](war_game/README.md)

### 기록 기준

| 기준 | 설명 |
|------|------|
| 메커니즘 우선 | 플래그보다 필터, 레이어, 권한, 입출력, 질의 구조를 먼저 기술 |
| 재현 가능성 | 명령, 경로, 조건을 남겨 동일 절차를 반복할 수 있게 함 |
| 관찰–가설–검증 | 추측만 적지 않고 출력·소스로 확인한 뒤 기록 |
| 자동화의 위치 | 반복 작업은 스크립트, 근거와 해석은 문서 |

---

## 범위

```text
보안 인식                         (security_awareness — 완료)
  사고 사례, 예방·대응; 사람, 데이터, 물리, AI

Linux 기초                        (linux_101 — 완료)
  셸, 파일, 프로세스, fd/pipe, 사용자
       │
       ├── 원격 접속               Netcat, SSH
       ├── 컨테이너                Docker 이미지·레이어
       ├── 입력 검증               정규식, 필터
       ├── 프로토콜 자동화         pwntools
       │
       └── 웹
            기초                   web_basics
            취약 유형              web_hacking
            클라이언트             XSS, CSRF
            서버                   파일, SQLi, NoSQL, SSRF
```

| 영역 | 내용 | 노트 / 문제 |
|------|------|-------------|
| Learn 지도 | Path 분류, 진도 규칙, 추천 순서 | [lecture/](lecture/) |
| 보안 인식 | 사회공학, 계정, 악성코드, 데이터·물리, AI | [security_awareness/](security_awareness/) |
| 시스템 | 경로, 권한, 프로세스, 파일 디스크립터 | [linux_101/](linux_101/), [#837](https://dreamhack.io/wargame/challenges/837) |
| 웹 기초 | HTTP, 브라우저, DevTools | [web_basics/](web_basics/), [#267](https://dreamhack.io/wargame/challenges/267) |
| 인증 상태 | 쿠키, 세션, SOP/CORS | [web_basics/03](web_basics/03-cookie-session.md)–[04](web_basics/04-sop-cors.md) |
| 웹 취약 | XSS, CSRF, 파일, 주입, SSRF | [web_hacking/](web_hacking/) |
| 클라이언트 웹 | XSS, CSRF | [#28](https://dreamhack.io/wargame/challenges/28), [#268](https://dreamhack.io/wargame/challenges/268), [#26](https://dreamhack.io/wargame/challenges/26), [#269](https://dreamhack.io/wargame/challenges/269) |
| 파일 | 업로드 실행, 경로 조작 다운로드 | [#38](https://dreamhack.io/wargame/challenges/38), [#37](https://dreamhack.io/wargame/challenges/37) |
| 주입 | SQLi, Blind, NoSQL `$regex` | [#24](https://dreamhack.io/wargame/challenges/24), [#90](https://dreamhack.io/wargame/challenges/90) |
| SSRF | 서버 측 내부 요청 | [#75](https://dreamhack.io/wargame/challenges/75) |
| 원격 | TCP, SSH | [#812](https://dreamhack.io/wargame/challenges/812), [#875](https://dreamhack.io/wargame/challenges/875) |
| 컨테이너 | 레이어, whiteout | [#876](https://dreamhack.io/wargame/challenges/876), [#853](https://dreamhack.io/wargame/challenges/853) |
| 정규식 | 패턴 매칭, 필터 공백 | [#834](https://dreamhack.io/wargame/challenges/834), [#873](https://dreamhack.io/wargame/challenges/873) |
| 자동화 | 시간 제약 하의 프로토콜 I/O | [#1114](https://dreamhack.io/wargame/challenges/1114), [#1874](https://dreamhack.io/wargame/challenges/1874) |

---

## 워게임

| ID | 이름 | 분류 | 요지 |
|----|------|------|------|
| [812](https://dreamhack.io/wargame/challenges/812) | welcome-beginners | Netcat | TCP 접속, 포트 |
| [875](https://dreamhack.io/wargame/challenges/875) | exercise-ssh | SSH | 원격 셸 |
| [876](https://dreamhack.io/wargame/challenges/876) | exercise-docker | Docker | 빌드·실행 |
| [853](https://dreamhack.io/wargame/challenges/853) | blue-whale | Docker | 레이어 잔존, whiteout |
| [834](https://dreamhack.io/wargame/challenges/834) | ex-reg-ex | Regex | 패턴 구성 |
| [873](https://dreamhack.io/wargame/challenges/873) | phpreg | Web / Regex | 필터 조건, 명령 경로 |
| [837](https://dreamhack.io/wargame/challenges/837) | baby-linux | Linux | 글로브, 출력 채널 |
| [1114](https://dreamhack.io/wargame/challenges/1114) | addition-quiz | Misc | 시간 제약 응답 자동화 |
| [1874](https://dreamhack.io/wargame/challenges/1874) | flag-shop | Misc | 상태 추적 자동화 |
| [267](https://dreamhack.io/wargame/challenges/267) | devtools-sources | DevTools | Sources |
| [6](https://dreamhack.io/wargame/challenges/6) | cookie | Cookie | 클라이언트 쿠키 신뢰 |
| [409](https://dreamhack.io/wargame/challenges/409) | session-basic | Session | 세션 ID와 서버 상태 |
| [28](https://dreamhack.io/wargame/challenges/28) | xss-1 | XSS | 봇 쿠키 → memo |
| [268](https://dreamhack.io/wargame/challenges/268) | xss-2 | XSS | script 필터, `onerror` |
| [38](https://dreamhack.io/wargame/challenges/38) | image-storage | File upload | PHP 웹쉘 |
| [37](https://dreamhack.io/wargame/challenges/37) | file-download-1 | Path traversal | `../flag.py` |
| [24](https://dreamhack.io/wargame/challenges/24) | simple_sqli | SQLi | 이중 따옴표 질의, `admin";--` |
| [26](https://dreamhack.io/wargame/challenges/26) | csrf-1 | CSRF | 권한 GET → memo |
| [269](https://dreamhack.io/wargame/challenges/269) | csrf-2 | CSRF | 비밀번호 변경 후 로그인 |
| [90](https://dreamhack.io/wargame/challenges/90) | Mango | NoSQL | `$regex`, 요청 필터 |
| [75](https://dreamhack.io/wargame/challenges/75) | web-ssrf | SSRF | loopback 표기, 포트 탐색 |

웹 취약점: [web_hacking/](web_hacking/) · [log 2026-08-07](log_for_study/2026-08-07.md)

---

## 일자별 기록

| 날짜 | 요약 | 로그 |
|------|------|------|
| 2026-08-08 | Security Awareness Training Path | [log](log_for_study/2026-08-08.md) |
| 2026-08-07 | XSS, 파일, SQLi, CSRF, NoSQL, SSRF | [log](log_for_study/2026-08-07.md) |
| 2026-08-06 | Linux 101 완료; 웹 기초; 쿠키·세션 | [log](log_for_study/2026-08-06.md) |
| 2026-08-05 | Linux Lab; baby-linux | [log](log_for_study/2026-08-05.md) |
| 2026-08-04 | Tips (nc/SSH/Docker/regex); 입문 워게임 | [log](log_for_study/2026-08-04.md) |
| 2026-08-03 | pwntools; addition-quiz; flag-shop | [log](log_for_study/2026-08-03.md) |

---

## 도구

참고: [Tips make life easier](https://dreamhack.io/lecture/units/tips-make-life-easier), [2026-08-04 로그](log_for_study/2026-08-04.md)

| 도구 | 역할 | 예 |
|------|------|-----|
| Netcat | TCP 접속 | `ncat host port` |
| SSH | 원격 셸 | `ssh user@host -p port` |
| Docker | 이미지·레이어 분석 | `build` / `run` / `pull` |
| 정규식 | 검증·필터 분석 | `\w`, `\d` |
| pwntools | 프로세스·소켓 I/O | `remote()`, `sendline` |
| DevTools | 요청, 쿠키, 스크립트 | Network, Application, Sources |

```bash
ncat host3.dreamhack.games PORT
ssh chall@host3.dreamhack.games -p PORT

docker version
docker build -t name .
docker run -it name /bin/bash

# 포트 A/tcp → B/tcp 이면 접속 포트는 A
# 웹: http://host:port
```

보충: [lecture/](lecture/README.md), [linux_101/](linux_101/commands-cheatsheet.md), [web_basics/](web_basics/README.md), [web_hacking/](web_hacking/README.md), [security_awareness/](security_awareness/README.md)

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

`solve.py`의 `HOST`, `PORT`는 인스턴스 생성 후 설정한다.

문제 단위 README에는 가능하면 다음을 둔다: 링크, 목적 한 줄, 관찰(제약·필터), 절차, 성립 근거.

---

## 참고

- [Dreamhack Learn](https://dreamhack.io/lecture) · [Paths](https://dreamhack.io/lecture/paths) · [Wargame](https://dreamhack.io/wargame/)
- [Security Awareness Training](https://dreamhack.io/lecture/paths/security-awareness-training)
- [Linux 101](https://dreamhack.io/lecture/paths/linux-101)
- [웹 기초](https://dreamhack.io/lecture/units/webhacking-basic-knowledeges)
- [Cookie & Session](https://dreamhack.io/lecture/units/webhacking-cookie-session)
- [Tips make life easier](https://dreamhack.io/lecture/units/tips-make-life-easier)
- [정규표현식 #461](https://learn.dreamhack.io/461)
- [pwntools](https://docs.pwntools.com/)
