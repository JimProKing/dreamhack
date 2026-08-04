# blue-whale (#853)

- 링크: https://dreamhack.io/wargame/challenges/853
- 카테고리: Beginner / Docker
- 공부 로그: `log_for_study/2026-08-04.md`
- **로컬 `docker build` 로 푸는 문제 아님**

## 한 줄 요약

Hub 이미지 `dreamhackofficial/blue-whale:1` 를 받아, **삭제되기 전 레이어**에 남은 flag를 찾는다.

## 왜 `docker build` 하면 안 되나

| #876 Exercise: Docker | #853 blue-whale |
|----------------------|-----------------|
| 문제 zip **로컬 빌드** | Hub **`docker pull :1`** |
| `cat flag` | 중간 **레이어** 분석 |

- 문제 zip의 `Dockerfile` 은 “이렇게 빌드했다”는 **참고용**
- 로컬에 `deploy/flag` 도 없어서 build 해도 의미 없음
- #876 때 쓰던 `docker build -t dreamhack-docker .` → **이 문제에서는 쓰지 말 것**

## Dockerfile이 하는 일

```dockerfile
COPY ./deploy/flag /home/chall/flag
WORKDIR /home/chall
RUN touch `python3 -c "print(open('./flag', 'r').read())"`
RUN rm *
```

1. flag 복사  
2. flag **내용**을 파일 **이름**으로 touch  
3. `rm *` 로 삭제  

Docker는 레이어라서 지워도 **이전 레이어**에 남음.  
`rm` 레이어에는 `.wh.flag` 같은 whiteout 만 보임.

## Docker 엔진 에러

```text
failed to connect to the docker API ... dockerDesktopLinuxEngine
```

= Docker Desktop **꺼짐**.

1. 바탕화면 **Docker Desktop** 실행  
2. 고래 아이콘 Running 될 때까지 대기  
3. `docker version` → **Server:** 줄 확인  
4. 풀이 끝날 때까지 **Quit 하지 말 것**

```powershell
powershell -ExecutionPolicy Bypass -File .\start-docker.ps1
```

## 풀이 (추천: 스크립트)

```powershell
cd C:\Users\a\Desktop\dreamhack\war_game\blue-whale_853
powershell -ExecutionPolicy Bypass -File .\start-docker.ps1
powershell -ExecutionPolicy Bypass -File .\solve.ps1
```

## 풀이 (dive — 문제 힌트)

```powershell
docker pull dreamhackofficial/blue-whale:1
# latest 아님. :1 필수

docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive:latest dreamhackofficial/blue-whale:1
```

### dive 화면 예시

```text
왼쪽 Layers                              오른쪽 파일 트리
78 MB  FROM blobs                        ├── boot
44 MB  RUN apt-get update                ├── dev
30 MB  RUN apt-get install python3       ├── etc        ← 여기만 보면 flag 없음
334 kB RUN adduser                       ├── home       ← 여기로
69 B   COPY ./deploy/flag /home/chall/flag
... touch / rm * ...
```

| 키 | 동작 |
|----|------|
| ↑↓ | 레이어 / 파일 이동 |
| **Tab** | 왼쪽 ↔ 오른쪽 |
| Enter / → | 폴더 들어가기 |
| Home | 목록 맨 위 |
| q / Ctrl+C | 종료 |

### dive 조작 순서

1. 왼쪽: **`COPY ... flag`** (69 B) 또는 **`touch`** (`rm` **전**)
2. **Tab** → 오른쪽
3. `home` → `chall` (처음에 `etc`만 보이면 경로 잘못 본 것)
4. `flag` (69 B) 또는 파일명 `DH{...}` / `rm` 레이어의 빨간 삭제·whiteout
5. dive는 내용 미리보기가 약함 → 파일명이 `DH{...}` 이거나 `solve.ps1` 로 내용 확인

## 확인한 결과 (2026-08-04)

```text
# 최종 컨테이너 — flag 없음
docker run --rm --entrypoint ls dreamhackofficial/blue-whale:1 -la /home/chall

# 플래그
DH{b06cb27a502a831822f927562258c6f69b5996a9916206cdb8755cc90ebf3b9f}
```

- COPY/touch 레이어: `home/chall/flag` 내용 = 위 플래그  
- touch 레이어: 파일 이름 자체가 `DH{...}`  
- rm 레이어: `.wh.flag`, `.wh.DH{...}` whiteout  

## 파일

| 파일 | 설명 |
|------|------|
| `Dockerfile` | 문제 제공 참고용 (로컬 빌드 X) |
| `solve.ps1` | pull → 레이어에서 flag 추출 |
| `start-docker.ps1` | Docker Desktop 실행 + 엔진 대기 |
| `_work/`, `_extract/` | 로컬 분석 임시 (gitignore) |
