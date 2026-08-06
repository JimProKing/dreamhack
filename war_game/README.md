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

---

## 폴더 관례

```text
{slug}_{id}/
├── README.md        # 메타 · 관찰 · 절차 · 근거 (필수에 가깝게)
├── original.zip     # 제공 파일 (있을 때)
├── solve.py|.ps1    # 재현 스크립트 (있을 때)
└── ...              # 소스, Dockerfile, 로컬 바이너리 등
```

| 넣을 것 | 넣지 말 것 |
|---------|------------|
| 분석에 쓴 소스·스크립트 | 대용량 레이어 추출물 (`_extract/`, `_work/` — gitignore) |
| 재현 명령, 핵심 조건 | 일회성 포트/토큰만 남긴 메모 (로그로) |
| “왜 되는지” 한 단락 | 플래그만 있는 빈 폴더 |

일자별 맥락·시행착오는 [`../log_for_study/`](../log_for_study/) 에 두고, 여기 README에는 **다시 쓸 결론**을 모읍니다.
