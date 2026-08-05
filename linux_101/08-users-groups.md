# 8. 사용자와 그룹

- 강의: [Linux Users and Groups](https://dreamhack.io/lecture/units/users-groups)
- Lab: Linux - User (드림핵 Lab)

## 무엇을 배우나

- 사용자·그룹 개념  
- 파일 **소유자·권한**  
- 관련 명령  

## 사용자 / 그룹

| 개념 | 설명 |
|------|------|
| **user** | 로그인 계정 (UID) |
| **group** | 사용자 묶음 (GID) |
| root | 관리자 (UID 0) |

```bash
whoami
id
```

## 파일 권한 (`ls -l`)

```text
-rw-r--r--  1 user group  ...  file
 d rwx r-x r-x  2 user group  ...  dir
│ └─┬─┘ └─┬─┘ └─┬─┘
│   u     g     o
│  소유자 그룹  그 외
```

| 문자 | 의미 |
|------|------|
| `r` | 읽기 |
| `w` | 쓰기 |
| `x` | 실행(파일) / 통과(디렉터리) |
| `-` | 없음 |

```bash
chmod 755 script.sh
chmod u+x script.sh
chown user:group 파일    # 보통 root 권한 필요
```

| 숫자 | 의미 |
|------|------|
| 4 | r |
| 2 | w |
| 1 | x |
| 7 = 4+2+1 | rwx |
| 5 = 4+1 | r-x |

## 사용자 관련 명령 (맛보기)

```bash
# 목록·정보 (환경에 따라)
cat /etc/passwd | head
groups

# 관리 (권한 필요, 랩 안내에 따름)
# useradd, usermod, userdel, groupadd ...
```

## 보안과의 연결

- 웹셸·권한 상승: **누가 어떤 파일을 읽고 쓸 수 있는지**
- SUID 바이너리, 잘못된 `chmod 777` 등이 취약점으로 이어짐

## Path 마무리

Linux 101 유닛 8개를 한 바퀴 돌면:

환경 → 셸 → 파일 → 프로세스 → 변수 → fd/pipe → 유저·권한

이후 시스템 해킹·웹·포렌식 Path 로 이어가기 좋다.

[commands-cheatsheet.md](./commands-cheatsheet.md) · [README.md](./README.md)
