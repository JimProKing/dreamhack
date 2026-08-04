# Exercise: Docker (#876)

- 링크: https://dreamhack.io/wargame/challenges/876
- 카테고리: Beginner
- 풀이 메모: 아래 + `log_for_study/2026-08-04.md`

## 한 줄 요약

문제 파일의 `Dockerfile`을 로컬에서 빌드 → 컨테이너 실행 → `cat flag`.

## 폴더 구조

```
exercise-docker_876/
├── Dockerfile      # 이미지 빌드 설계도
├── deploy/
│   ├── chall       # 컨테이너에 들어갈 바이너리
│   └── flag        # 빌드 시 컨테이너 안으로 복사됨
├── original.zip    # 드림핵에서 받은 원본 압축
└── README.md
```

## 풀이

Docker Desktop 실행 후, **이 폴더**에서:

```powershell
cd C:\Users\a\Desktop\dreamhack\war_game\exercise-docker_876

docker build -t dreamhack-docker .
docker images
docker run -it dreamhack-docker /bin/bash

# 컨테이너 안에서
ls -al
cat flag
exit
```

## 실제 세션 (2026-08-04)

- Docker Desktop 4.84.0 / Engine 29.6.2 확인 후 빌드·실행
- 플래그: `DH{docker_exercise}`

## 참고 (Windows cmd)

- `ls` 는 안 됨 → `dir` 사용
- `cd` 대상은 **폴더**여야 함 (`.zip` 파일 경로로 cd 불가)
