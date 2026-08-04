# ex-reg-ex (#834)

- 링크: https://dreamhack.io/wargame/challenges/834
- 강의: https://learn.dreamhack.io/461 (정규표현식)
- 카테고리: Web / Beginner
- 공부 로그: `log_for_study/2026-08-04.md`

## 한 줄 요약

`app.py`의 정규식에 맞는 문자열을 **드림핵 웹 서버**에 입력하면 플래그.

## 문제 파일

다운로드에 **`app.py`만** 있는 경우 → **정상**.

| 파일 | 어디에 있나 |
|------|-------------|
| `app.py` | zip (읽어서 정규식 파악) |
| `index.html`, 진짜 flag | **원격 서버** 안 |
| 로컬 `python app.py` | 정석 아님 (템플릿 없으면 에러) |

## 정석 풀이 순서

1. `app.py` 에서 정규식 확인  
2. 맞는 문자열 만들기 → 예: `drabcdee1am@abc.com`  
3. 드림핵 **서버 생성**  
4. 브라우저 `http://host:port`  
5. 입력 → `DH{...}` 제출  

## 핵심 코드

```python
m = re.match(r'dr\w{5,7}e\d+am@[a-z]{3,7}\.\w+', input_val)
if m:
    # flag 표시
```

## 정규식 분해

```text
패턴: dr \w{5,7} e \d+ am@ [a-z]{3,7} \. \w+
입력: dr  abcde   e  1  am@  abc       .  com
   →  drabcdee1am@abc.com
```

| 조각 | 의미 | 예 |
|------|------|-----|
| `dr` | 고정 | `dr` |
| `\w{5,7}` | 영문/숫자/`_` 5~7자 | `abcde` |
| `e` | 고정 | `e` |
| `\d+` | 숫자 1개 이상 | `1` |
| `am@` | 고정 | `am@` |
| `[a-z]{3,7}` | 소문자 3~7자 | `abc` |
| `\.` | 점 | `.` |
| `\w+` | 단어 문자 1개 이상 | `com` |

`drabcdee` = `dr` + `abcde` + `e` (한 덩어리가 아님).

## 강의 개념 요약 (#461)

- 정규식 = 문자열 **패턴** 규칙  
- 수량자: `*` `+` `?` `{n}` `{n,m}`  
- 문자: `.` `\w` `\d` `\s` `[a-z]` `[^]`  
- 위치: `^` 시작, `$` 끝  
- 이스케이프: `\.` 는 진짜 점  
- Python: `re.match` (앞부터), `re.search` (중간도)  
- 연습: [regexr.com](https://regexr.com/), [regexper.com](https://regexper.com/), CyberChef Regular expression  

자세한 표·예시는 `log_for_study/2026-08-04.md` 의 **강의: 정규표현식** 절.

## 로컬 파일 (이 폴더)

| 파일 | 설명 |
|------|------|
| `app.py` | 문제 소스 |
| `templates/index.html` | 로컬 연습용 (선택) |
| `flag.txt` | 로컬 연습용 (진짜 플래그 아님) |
| `original.zip` | 드림핵 원본 |

제출용 플래그는 **드림핵 서버**에서만.
