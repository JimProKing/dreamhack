# Linux 101 — 명령 치트시트

## 이동·목록

```bash
pwd
ls
ls -al
cd 경로
cd ..
cd ~
```

## 파일 내용

```bash
cat 파일
head -n 20 파일
tail -n 20 파일
tail -f 로그
less 파일          # q 종료
```

## 파일·디렉터리 조작

```bash
mkdir 이름
rmdir 빈폴더
rm 파일
rm -r 폴더
cp 원본 대상
mv 원본 대상
touch 파일
```

## 검색

```bash
grep '패턴' 파일
명령 | grep '패턴'
grep -o 'IIIII.*lllll'
find . -name '*.txt'
```

## 프로세스

```bash
ps aux
ps -el
ps -el | grep 이름
ps -C 이름 -o pid,stat,cmd
kill PID
kill -9 PID
killall 이름
pkill 이름
```

## 컴파일

```bash
gcc -o hello hello.c
./hello
file hello
```

## fd · pipe · 리다이렉션

```bash
ls /proc/$$/fd
ls /proc/$$/fd | wc -l

cat 파일 | grep '패턴'

명령 > 파일
명령 >> 파일
명령 < 파일
명령 2> 에러파일
```

## 환경·유저

```bash
echo $HOME
echo $PATH
env
whoami
id
chmod +x 파일
```

## 상태 코드 (ps)

| 코드 | 의미 |
|------|------|
| R | Running |
| S | Sleep (interruptible) |
| D | Uninterruptible sleep |
| T | Stopped |
| Z | Zombie |
