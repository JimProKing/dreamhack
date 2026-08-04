# 해킹 입문, 기초 팁 (Tips make life easier)

- 강의: [Hacker's Life Hacks / tips-make-life-easier](https://dreamhack.io/lecture/units/tips-make-life-easier)
- 관련: [정규표현식 learn #461](https://learn.dreamhack.io/461)
- 목적: 보안·해킹 공부할 때 자주 쓰는 도구와 습관 정리

강의 구성 중 **Netcat, SSH, 코딩(에디터), Docker, 정규표현식** 을 중심으로 정리.
(강의에는 Googling, Markdown, Dreamhack Tools 도 포함)

---

## 한눈에 보기

| 주제 | 한 줄 | 드림핵에서 | 오늘 연결 문제 |
|------|--------|------------|----------------|
| **Netcat** | TCP로 서버에 붙는 만능 통신 도구 | pwn/misc 서버 | #812 Welcome-Beginners |
| **SSH** | 암호화된 원격 셸 로그인 | SSH 실습 서버 | #875 Exercise: SSH |
| **코딩/에디터** | 소스 읽고 스크립트 짜기 | VS Code, Vim | 전 문제 소스 분석 |
| **Docker** | 이미지·컨테이너로 실습 환경 | 로컬 빌드 / Hub pull | #876, #853 |
| **정규표현식** | 문자열 패턴 검사·치환 | 웹 필터, 입력 검증 | #834, #873 |

### 드림핵 접속 방식 요약

| 문제 유형 | 접속 |
|-----------|------|
| pwn / 일부 misc | `ncat host port` 또는 `nc host port` |
| SSH 실습 | `ssh user@host -p port` |
| 웹 | 브라우저 `http://host:port` |
| Docker 실습 | 로컬 `docker build` / `run` 또는 `pull` 후 분석 |

포트 표기 `A/tcp → B/tcp` 일 때 **밖에서 쓰는 포트는 A**.

---

## 1. Netcat (nc / ncat)

### 무엇인가

- **네트워크 스위스 아미 나이프** — TCP(·UDP)로 읽고 쓰기
- 서버에 붙는 **클라이언트**, 포트 열어서 기다리는 **리스너** 둘 다 가능
- 드림핵: 브라우저 URL이 아니라 **바이너리 서비스**일 때 자주 사용

### 기본 사용

```bash
nc host port
# Windows (Nmap 번들): ncat host port
```

예:

```bash
ncat host3.dreamhack.games 12902
```

### 드림핵에서의 흐름

1. 문제 페이지 **서버 생성**
2. Host / Port 확인 (`host3.dreamhack.games`, `12902` 등)
3. `ncat host port` 로 접속
4. 프롬프트에 맞춰 입력 → 플래그

### 실습 문제

- [Exercise: Welcome-Beginners (#812)](https://dreamhack.io/wargame/challenges/812)  
  → 접속 후 `Dreamhack` 입력 → `DH{...}`

### 자동화

사람이 타이핑하기 빡센 문제(시간 제한 등)는 **pwntools** `remote(host, port)` 로 같은 통신을 스크립트화.

```python
from pwn import *
p = remote('host3.dreamhack.games', 12902)
p.sendlineafter(b': ', b'Dreamhack')
print(p.recvall(timeout=2))
```

### Windows

| 도구 | 비고 |
|------|------|
| `ncat` | Nmap 설치 시 포함 |
| `nc` | 환경에 따라 없음 |
| pwntools | venv + `pip install pwntools` |

---

## 2. SSH (Secure Shell)

### 무엇인가

- **암호화된 원격 접속** 프로토콜
- 원격 리눅스에 로그인해서 셸·파일 작업
- 비밀번호 또는 개인키(`-i`) 인증

### 기본 사용

```bash
ssh user@HOST -p PORT
# 키 파일 쓸 때
ssh user@HOST -p PORT -i 개인키경로
```

| 부분 | 의미 |
|------|------|
| `user` | 서버 계정 (예: `chall`) |
| `HOST` | 도메인/IP |
| `-p PORT` | SSH 포트 (기본 22가 아닐 때 필수) |

예:

```bash
ssh chall@host3.dreamhack.games -p 13277
# password: (문제에서 준 값, 예: dhbgssh)
```

### 드림핵에서의 흐름

1. 서버 생성 → host / port / id / password 확인  
2. `ssh id@host -p port`  
3. 첫 접속 시 fingerprint → `yes`  
4. 비밀번호 입력 (화면에 안 보여도 정상)  
5. 셸에서 `ls`, `cat flag` 등  
6. `exit` 로 종료  

### 실습 문제

- [Exercise: SSH (#875)](https://dreamhack.io/wargame/challenges/875)  
  - id: `chall` / password: `dhbgssh`  
  - `ls` → `cat flag`

### Windows

```powershell
Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH.Client*'
# State : Installed 이면 ssh 사용 가능
```

---

## 3. 코딩 / 에디터 (VS Code, Vim)

### 왜 필요하나

- 문제 소스(`app.py`, `step2.php`, `chall.c`, Dockerfile)를 **읽고** 조건 파악
- 풀이 스크립트·메모 작성
- 정규식·필터·버그 위치를 코드에서 찾기

### Visual Studio Code

- GUI 에디터, 확장·디버깅·터미널 통합
- `.py` / `.php` / `.c` / `.md` 모두 열기 좋음
- Windows: 바탕화면 **Visual Studio Code** 또는 `code 파일경로`

### Vim

- 터미널 안에서 쓰는 에디터 (SSH 서버 안에서도 가능)
- 최소: `vim 파일` → `i` 입력 모드 → `Esc` → `:wq` 저장 종료 / `:q!` 저장 안 함

### 드림핵 습관

| 할 일 | 방법 |
|------|------|
| 문제 파일 다운로드 | zip 풀고 에디터로 소스 열기 |
| PHP/Python 웹 | **실행보다 소스 읽기**가 먼저 (서버는 드림핵이 돌림) |
| 공부 기록 | Markdown (`.md`) |

### 실습과 연결

- #834 `app.py` — VS Code/메모장  
- #873 `step2.php` — 동일 (브라우저로 .php 더블클릭 X)

---

## 4. Docker

### 개념

```text
Dockerfile (설계도) → docker build → Image (템플릿)
                              ↓ docker run
                         Container (실행 인스턴스)
```

| 용어 | 의미 |
|------|------|
| **Dockerfile** | 이미지 만드는 지시서 |
| **Image** | 읽기 전용 스냅샷 (레이어 쌓임) |
| **Container** | 이미지를 실행한 프로세스/환경 |
| **Layer** | 빌드 단계별 파일 시스템 조각. 삭제해도 이전 레이어에 남을 수 있음 |

### 자주 쓰는 명령

```bash
docker version / docker info     # 엔진 동작 확인 (Server 필요)
docker pull 이미지:태그          # Hub에서 받기
docker build -t 이름 .           # 현재 폴더 Dockerfile로 빌드
docker images                    # 이미지 목록
docker run -it 이미지 /bin/bash  # 컨테이너 + 대화형 셸
docker ps / docker ps -a         # 실행 중 / 전체 컨테이너
docker stop / docker rm / docker rmi
docker save 이미지 -o out.tar    # 이미지 내보내기 (레이어 분석용)
```

| 옵션 | 의미 |
|------|------|
| `-t 이름` | 이미지 이름 태그 |
| `-i` | 표준 입력 유지 |
| `-t` | 터미널 할당 (`-it` 자주 함께) |
| `-p 호스트:컨테이너` | 포트 연결 |
| `--rm` | 종료 시 컨테이너 삭제 |

### Windows

1. **Docker Desktop** 실행  
2. `docker version` 에 **Server** 줄이 보여야 함  
3. 꺼져 있으면: `failed to connect to the docker API ...`

### 실습 문제

| 문제 | 할 일 |
|------|--------|
| [Exercise: Docker (#876)](https://dreamhack.io/wargame/challenges/876) | 문제 Dockerfile **로컬 빌드** → `run` → `cat flag` |
| [blue-whale (#853)](https://dreamhack.io/wargame/challenges/853) | `docker pull dreamhackofficial/blue-whale:1` 후 **레이어 분석** (dive / save). 최종 컨테이너엔 flag 없음 |

```bash
# #876 스타일
docker build -t dreamhack-docker .
docker run -it dreamhack-docker /bin/bash

# #853 스타일
docker pull dreamhackofficial/blue-whale:1
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive:latest dreamhackofficial/blue-whale:1
```

이 레포: `war_game/exercise-docker_876/`, `war_game/blue-whale_853/` (`solve.ps1`)

---

## 5. 정규표현식 (Regex)

### 무엇인가

문자열에서 **패턴**을 찾거나, 맞는지 검사하거나, 치환하는 규칙 언어.  
웹 입력 검증, 로그 파싱, **필터 우회 문제**에 자주 등장.

### 핵심 기호

| 기호 | 의미 |
|------|------|
| `.` | 아무 문자 1개 (개행 제외 기본) |
| `\w` | `[A-Za-z0-9_]` |
| `\d` | 숫자 `[0-9]` |
| `\s` | 공백 |
| `*` / `+` / `?` | 0회 이상 / 1회 이상 / 0·1회 |
| `{n}` `{n,m}` | 정확히 n / n~m회 |
| `[a-z]` `[^0-9]` | 집합 / 부정 |
| `^` `$` | 시작 / 끝 |
| `\.` `\@` | 이스케이프 (문자 그대로) |
| `\|` `(...)` | OR / 그룹 |

### Python / PHP

```python
import re
re.match(r'패턴', s)    # 앞부터
re.search(r'패턴', s)   # 중간도
re.sub(r'패턴', '치환', s)
```

```php
preg_match("/패턴/", $s);
preg_replace("/패턴/i", "", $s);  // i = 대소문자 무시
```

### 연습 도구

- [regexr.com](https://regexr.com/)
- [regexper.com](https://regexper.com/)
- [Dreamhack CyberChef](https://tools.dreamhack.games/cyberchef) → Regular expression  
- 강의: [learn #461](https://learn.dreamhack.io/461)

### 실습 문제

| 문제 | 접근 |
|------|------|
| [ex-reg-ex (#834)](https://dreamhack.io/wargame/challenges/834) | `re.match` 패턴에 **맞는** 문자열 입력 |
| [phpreg (#873)](https://dreamhack.io/wargame/challenges/873) | `preg_replace`/`preg_match` **필터 우회** 후 `system()` |

```text
#834 예 입력
drabcdee1am@abc.com

#873 예
Nickname: dnnyangyang0310
Password: 0@12319!+1+13
Command:  cat ../dream/????.txt
```

이 레포: `war_game/ex-reg-ex_834/`, `war_game/phpreg_873/`  
상세: `log_for_study/2026-08-04.md` 정규식·phpreg 절

---

## 강의 커리큘럼 ↔ 워게임 맵

```text
Netcat  ──────────► Exercise: Welcome-Beginners (#812)
SSH     ──────────► Exercise: SSH (#875)
Coding  ──────────► 전 문제 소스 읽기 (VS Code 등)
Docker  ──────────► Exercise: Docker (#876), blue-whale (#853)
Regex   ──────────► ex-reg-ex (#834), phpreg (#873)
(+ Tools) ────────► CyberChef 등 dreamhack-tools
```

---

## 치트시트 (복붙용)

```bash
# Netcat
ncat host3.dreamhack.games PORT

# SSH
ssh chall@host3.dreamhack.games -p PORT

# Docker
docker version
docker build -t name .
docker run -it name /bin/bash
docker pull repo:tag

# 정규식 검증 (Python)
python -c "import re; print(bool(re.match(r'dr\w{5,7}e\d+am@[a-z]{3,7}\.\w+', 'drabcdee1am@abc.com')))"
```
