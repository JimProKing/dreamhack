# war_game

Dreamhack 워게임 단위 분석·풀이 모음입니다.  
폴더 이름: `{slug}_{challenge_id}/`

상위 맵: [../README.md](../README.md)

---

## 인덱스

| ID | 폴더 | 영역 | 핵심 | 산출물 |
|----|------|------|------|--------|
| [812](https://dreamhack.io/wargame/challenges/812) | [welcome-beginners_812](welcome-beginners_812/) | Netcat | TCP 접속, 포트 | README |
| [875](https://dreamhack.io/wargame/challenges/875) | [exercise-ssh_875](exercise-ssh_875/) | SSH | 원격 셸 | README |
| [876](https://dreamhack.io/wargame/challenges/876) | [exercise-docker_876](exercise-docker_876/) | Docker | 이미지 빌드·실행 | Dockerfile, README |
| [853](https://dreamhack.io/wargame/challenges/853) | [blue-whale_853](blue-whale_853/) | Docker / 아티팩트 | 레이어 잔존, whiteout | solve.ps1, README |
| [834](https://dreamhack.io/wargame/challenges/834) | [ex-reg-ex_834](ex-reg-ex_834/) | Regex | 패턴 분해·매칭 | app.py, README |
| [873](https://dreamhack.io/wargame/challenges/873) | [phpreg_873](phpreg_873/) | Web / Regex | 필터 조건, 명령 경로 | step2.php, README |
| [837](https://dreamhack.io/wargame/challenges/837) | [baby-linux_837](baby-linux_837/) | Linux | 글로브, 출력 채널 | app.py, README |
| [1114](https://dreamhack.io/wargame/challenges/1114) | [addition-quiz_1114](addition-quiz_1114/) | Misc | 시간 제약 자동화 | solve.py, chall.c |
| [1874](https://dreamhack.io/wargame/challenges/1874) | [flag-shop_1874](flag-shop_1874/) | Misc | 상태 추적 자동화 | solve.py |
| [28](https://dreamhack.io/wargame/challenges/28) | — | XSS | 봇 쿠키 → memo | [log 08-07](../log_for_study/2026-08-07.md) |
| [268](https://dreamhack.io/wargame/challenges/268) | — | XSS | onerror 우회 | [log 08-07](../log_for_study/2026-08-07.md) |
| [38](https://dreamhack.io/wargame/challenges/38) | — | File Upload | php 웹쉘 | [log 08-07](../log_for_study/2026-08-07.md) |
| [37](https://dreamhack.io/wargame/challenges/37) | — | Path Traversal | `../flag.py` | [log 08-07](../log_for_study/2026-08-07.md) |
| [24](https://dreamhack.io/wargame/challenges/24) | — | SQLi | `admin";--` | [log 08-07](../log_for_study/2026-08-07.md) |
| [26](https://dreamhack.io/wargame/challenges/26) | — | CSRF | notice_flag → memo | [log 08-07](../log_for_study/2026-08-07.md) |
| [269](https://dreamhack.io/wargame/challenges/269) | — | CSRF | 비번 변경 후 로그인 | [log 08-07](../log_for_study/2026-08-07.md) |
| [90](https://dreamhack.io/wargame/challenges/90) | — | NoSQL | `$regex` / 필터 | [log 08-07](../log_for_study/2026-08-07.md) |
| [75](https://dreamhack.io/wargame/challenges/75) | — | SSRF | 내부 IP·포트 | [log 08-07](../log_for_study/2026-08-07.md) |

폴더 README 미분리 문제는 일자 로그에 절차·근거를 모아 둠. 필요 시 `{slug}_{id}/` 로 옮긴다.

---

## 영역별

### 원격 접속

| 문제 | 보는 것 |
|------|---------|
| welcome-beginners | `ncat` / `nc` 로 서비스에 붙기, 안내 포트 해석 |
| exercise-ssh | `ssh user@host -p port`, 원격 셸에서 파일 확인 |

### 컨테이너

| 문제 | 보는 것 |
|------|---------|
| exercise-docker | Dockerfile → 이미지 → 컨테이너, 내부에서 flag 확인 |
| blue-whale | **최종 파일시스템 ≠ 전체 이미지 역사**. 삭제 전 레이어·whiteout |

### 입력 검증 · 웹

| 문제 | 보는 것 |
|------|---------|
| ex-reg-ex | 서버 정규식을 분해해 **의도된 매칭 문자열** 구성 |
| phpreg | PHP 필터의 허용·금지 조건, 이후 명령 실행 경로 |

### 시스템 (Linux)

| 문제 | 보는 것 |
|------|---------|
| baby-linux | 단어 필터, 글로브(`*`/`?`), ANSI/출력 채널에 가려진 문자열 |

관련 기초 노트: [`../linux_101/`](../linux_101/)

### 프로토콜 · 자동화

| 문제 | 보는 것 |
|------|---------|
| addition-quiz | 반복 산술 응답, 타임아웃 → `pwntools` / 소켓 루프 |
| flag-shop | 메뉴·셔플 상태 추적 후 인덱스 선택 자동화 |

### 웹 취약 (2026-08-07)

| 문제 | 보는 것 |
|------|---------|
| xss-1 / xss-2 | 봇 브라우저 실행, memo로 유출, script 필터 우회 |
| image-storage / file-download-1 | 업로드 실행 · `../` 경로 |
| simple_sqli | 쿼리 따옴표 종류, 주석으로 조건 제거 |
| csrf-1 / csrf-2 | img GET으로 권한 요청 (memo vs 비번 변경) |
| Mango | Mongo `$regex`, 금칙어 필터 |
| web-ssrf | 서버 대신 내부 요청, IP 표기·포트 스캔 |

상세: [`../log_for_study/2026-08-07.md`](../log_for_study/2026-08-07.md)

---

## 폴더

```text
{slug}_{id}/
├── README.md        # 요약 · 풀이 · 왜 되는지
├── original.zip     # 있을 때
├── solve.py|.ps1    # 있을 때
└── ...
```

큰 추출물(`_extract/`, `_work/`)은 gitignore.  
그날 흐름·삽질은 `log_for_study/`, 여기엔 다시 볼 풀이 위주.
