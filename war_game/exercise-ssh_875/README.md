# Exercise: SSH (#875)

- 링크: https://dreamhack.io/wargame/challenges/875
- 카테고리: Beginner
- 풀이 메모: 아래 + `log_for_study/2026-08-04.md`

## 한 줄 요약

SSH로 서버 로그인 후 `cat flag` 로 플래그 읽기.

## 접속 정보 (문제 제공)

| 항목 | 값 |
|------|-----|
| id | `chall` |
| password | `dhbgssh` |

## 풀이

```powershell
# OpenSSH 설치 여부 (Windows)
Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH.Client*'

# 서버 생성 후 나온 포트로 접속
ssh chall@host3.dreamhack.games -p <PORT>
# fingerprint → yes
# password → dhbgssh

ls
cat flag
```

## 실제 세션 (2026-08-04)

```text
ssh chall@host3.dreamhack.games -p 13277
# yes → password: dhbgssh
ls
# bin  flag
cat flag
# DH{h3110_6e9inn3rs!}
```

포트는 서버를 다시 만들면 바뀜.
