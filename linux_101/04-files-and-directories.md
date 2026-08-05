# 4. 파일과 디렉터리

- 강의: [Linux Files and Directories](https://dreamhack.io/lecture/units/files-and-directories)
- Lab: Linux - File / Linux - Directory (드림핵 Lab)

## 무엇을 배우나

리눅스 **디렉터리 구조**와 파일을 다루는 기본 명령.

## 경로

| 기호 | 의미 |
|------|------|
| `/` | 루트 |
| `~` | 홈 (`/home/사용자`) |
| `.` | 현재 |
| `..` | 상위 |

```bash
pwd
# /home/dreamhack
```

## 목록 보기

```bash
ls              # 일반 파일·폴더만
ls -a           # 숨김 포함
ls -l           # 자세히
ls -al          # 숨김 + 자세히
```

**숨김 파일** = 이름이 `.` 으로 시작. `ls` 만으로는 안 보임.

랩 예:

```bash
ls
# flag_90ad6cd7...  remove_dir

ls -al
# .hidden_flag_91a416ea...   ← 숨김 플래그
# flag_90ad6cd7...
# remove_dir
```

| 권한 열 맨 앞 | 의미 |
|---------------|------|
| `-` | 일반 파일 |
| `d` | 디렉터리 |

## 읽기

```bash
cat 파일
cat .hidden_flag*
cat flag_*
head -n 20 파일
tail -n 20 파일
```

## 만들기·지우기

```bash
mkdir hello_dir       # 디렉터리 생성
rmdir remove_dir      # 빈 디렉터리만 삭제
rm 파일
rm -r 디렉터리        # 내용 포함 삭제
touch 파일            # 빈 파일
cp 원본 대상
mv 원본 대상          # 이동/이름변경
```

| 명령 | 조건 |
|------|------|
| `rmdir` | **비어 있어야** 함 |
| `rm -r` | 안 비어 있어도 삭제 (주의) |

## 랩에서 한 일

```bash
pwd
ls
ls -al
mkdir hello_dir
rmdir remove_dir
cat .hidden_flag*    # 숨김 플래그 읽기
```

## 보안/CTF 팁

“파일이 안 보인다” → 먼저 **`ls -al`**.

## 다음에

[05-processes.md](./05-processes.md)
