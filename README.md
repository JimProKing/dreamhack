# dreamhack

[Dreamhack](https://dreamhack.io/) 강의·Path·워게임을 풀며, **동작 원리와 재현 절차**를 남기는 학습 노트 저장소입니다.

목표 점수가 아니라 **왜 되는지 / 어디서 막히는지 / 어떻게 다시 확인하는지**를 남깁니다.  
시작: 2026-08-03

---

## 학습 원칙

| 원칙 | 의미 |
|------|------|
| 메커니즘 우선 | 플래그보다 필터, 레이어, 권한, fd, 프로토콜이 어떻게 동작하는지 |
| 재현 가능 | 다른 날에도 같은 순서로 검증할 수 있게 명령·경로·조건을 고정 |
| 관찰 → 가설 → 검증 | 추측만 쓰지 않고, 출력·소스·레이어로 확인한 뒤 기록 |
| 자동화는 도구 | 반복 입출력·시간 제약은 스크립트로 두고, 핵심 이해는 문서로 |

세부 일지는 `log_for_study/`, 재사용 노트는 `linux_101/` · `web_basics/`, 문제 단위 산출물은 `war_game/` 에 둡니다.

---

## 저장소 구조

```text
.
├── README.md                 # 이 문서 (맵 + 관례)
├── requirements.txt          # Python 의존성
├── linux_101/                # Linux 101 Path — 시스템 기초 (완료)
├── web_basics/               # 웹·HTTP·쿠키·세션·SOP
├── war_game/                 # 워게임 단위 분석·풀이 (이름_번호/)
└── log_for_study/            # 일자별 학습 로그
```

| 경로 | 역할 |
|------|------|
| [`linux_101/`](linux_101/) | 셸, 파일·권한, 프로세스, fd, 사용자 — **시스템 관찰의 공통 기반** |
| [`web_basics/`](web_basics/) | HTTP/HTTPS, DevTools, Cookie·Session, SOP/CORS |
| [`war_game/`](war_game/) | 문제별 소스, 스크립트, 분석 메모. 인덱스: [`war_game/README.md`](war_game/README.md) |
| [`log_for_study/`](log_for_study/) | 그날 한 일, 시행착오, 강의 정리. 관례: [`log_for_study/README.md`](log_for_study/README.md) |

문제 폴더 이름: `{slug}_{challenge_id}/`  
예: `blue-whale_853/`, `baby-linux_837/`

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
       └─ 웹 기초 · 인증 상태               (web_basics)
            HTTP/HTTPS · DevTools
            Cookie · Session · SOP/CORS
```

| 영역 | 무엇을 보나 | 노트 / 문제 |
|------|-------------|-------------|
| **시스템 기초** | 경로, 권한, 프로세스, fd, 리다이렉션 | [`linux_101/`](linux_101/), [#837](https://dreamhack.io/wargame/challenges/837) |
| **웹 기초** | HTTP 요청·응답, 브라우저, DevTools | [`web_basics/`](web_basics/), [#267](https://dreamhack.io/wargame/challenges/267) |
| **인증 상태** | 쿠키·세션, 변조·신뢰 경계, SOP/CORS | [`web_basics/03`](web_basics/03-cookie-session.md)–[`04`](web_basics/04-sop-cors.md), [#6](https://dreamhack.io/wargame/challenges/6), [#409](https://dreamhack.io/wargame/challenges/409) |
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

---

## 일자별 기록

| 날짜 | 요약 | 로그 |
|------|------|------|
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
# Python 3.12 권장 (가상환경)
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

`solve.py` 안의 `HOST` / `PORT` 는 인스턴스 생성 후 값으로 맞춥니다.

---

## 문서 관례

문제 폴더 `README.md` 에 되도록 다음을 둡니다.

1. **메타** — 링크, 카테고리, 관련 로그  
2. **한 줄 요약** — 무엇이 목적인 문제인지  
3. **관찰** — 소스·동작·제약 (필터, 타임아웃, 레이어 등)  
4. **절차** — 재현 가능한 단계  
5. **왜 되는지** — 우회·성공 조건의 근거  

일자 로그에는 시행착오와 강의 맥락을, 주제 폴더(`linux_101/`, `web_basics/`)와 문제 폴더에는 **나중에 다시 쓸 결론**을 모읍니다.

---

## 참고 링크

- [Dreamhack](https://dreamhack.io/) · [Wargame](https://dreamhack.io/wargame/)
- [Linux 101 Path](https://dreamhack.io/lecture/paths/linux-101)
- [웹 해킹을 위한 웹 기초 지식](https://dreamhack.io/lecture/units/webhacking-basic-knowledeges)
- [Cookie & Session](https://dreamhack.io/lecture/units/webhacking-cookie-session)
- [Tips make life easier](https://dreamhack.io/lecture/units/tips-make-life-easier)
- [정규표현식 강의 #461](https://learn.dreamhack.io/461)
- [pwntools 문서](https://docs.pwntools.com/)
