# 4. Same-Origin Policy (SOP) · CORS

- 유닛: [Cookie & Session](https://dreamhack.io/lecture/units/webhacking-cookie-session)
- 관련: Mitigation: Same Origin Policy, Lab: Same Origin Policy

## Origin (출처)

브라우저는 페이지의 **출처** 를 다음 세 가지로 정의한다.

```text
스킴 + 호스트 + 포트
https://example.com:443  →  https | example.com | 443
```

| URL | 같은 origin? (기준: `https://a.com`) |
|-----|--------------------------------------|
| `https://a.com/x` | 같음 (경로만 다름) |
| `https://a.com:443` | 같음 (기본 포트) |
| `http://a.com` | **다름** (스킴) |
| `https://b.com` | **다름** (호스트) |
| `https://a.com:8443` | **다름** (포트) |
| `https://sub.a.com` | **다름** (호스트) |

---

## Same-Origin Policy (SOP)

**다른 origin 의 문서·스크립트가, 이 origin 의 데이터에 마음대로 접근하지 못하게** 하는 브라우저 기본 정책.

막는 것의 예:

- 다른 사이트 페이지의 DOM 읽기  
- 다른 사이트 응답 내용을 JS 로 읽기 (기본)  
- 다른 origin 쿠키를 JS 로 읽기  

막지 않는(또는 다르게 다루는) 것:

- `<img>`, `<script src>`, `<link>` 등 **임베드 로드** (내용은 실행·표시될 수 있어도, 읽는 권한은 제한)  
- 사용자가 폼으로 다른 사이트에 POST — **요청은 갈 수 있음** (CSRF 이슈와 연결). 응답을 읽지는 못함  

SOP 는 “요청을 전부 차단”이 아니라  
**누가 누구의 데이터를 읽을 수 있는가** 에 가깝다.

---

## CORS (Cross-Origin Resource Sharing)

SOP 때문에 막히는 **합법적 크로스 오리진 API 사용** 을 서버가 허용하는 메커니즘.

```text
브라우저                          API 서버 (다른 origin)
   |  Origin: https://app.com         |
   |  GET /api/data                   |
   | -------------------------------> |
   |  Access-Control-Allow-Origin:    |
   |    https://app.com               |
   | <------------------------------- |
   |  (헤더가 맞으면 JS 가 응답 사용)   |
```

| 헤더 (응답) | 의미 |
|-------------|------|
| `Access-Control-Allow-Origin` | 허용할 Origin (`*` 또는 구체 값) |
| `Access-Control-Allow-Credentials` | 쿠키 포함 요청 허용 여부 |
| `Access-Control-Allow-Methods` | 허용 메서드 |
| `Access-Control-Allow-Headers` | 허용 요청 헤더 |

### Preflight

`PUT`, 커스텀 헤더 등 “단순하지 않은” 요청 전에  
브라우저가 `OPTIONS` 로 서버에 먼저 물어본다.

### 보안 관점

| 설정 | 위험 |
|------|------|
| `Allow-Origin: *` + Credentials | 스펙상 조합 불가에 가깝지만, 잘못된 미들웨어·반사 Origin 주의 |
| 요청 Origin 을 **검증 없이 반사** | 악성 사이트가 피해자 쿠키로 API 읽기 |
| 민감 API 에 넓은 CORS | 데이터 유출 면 확대 |

분석 시 Network 에서 **실제 응답 CORS 헤더** 와 **요청 Origin** 을 같이 본다.

---

## 쿠키 · SOP · CSRF 와의 관계 (입문)

| 주제 | 한 줄 |
|------|--------|
| SOP | 다른 사이트 JS 가 내 페이지/응답을 못 읽게 |
| 쿠키 자동 전송 | 내가 로그인된 채 다른 사이트 폼이 내 사이트로 요청을 **보낼 수는** 있음 |
| SameSite 쿠키 | 그런 크로스 사이트 요청에 쿠키를 줄지 제한 |
| CORS | 다른 origin JS 가 **응답을 읽어도 되는지** 서버가 허용 |

Cookie & Session 유닛에서 SOP/CORS 를 같이 다루는 이유:  
**인증 상태(쿠키)가 어디까지 흘러가고, 누가 그 결과 데이터를 읽을 수 있는지** 가 웹 보안의 뼈대이기 때문.

---

## Lab 에서 확인할 것

1. 같은 origin / 다른 origin 페이지에서 스크립트로 요청했을 때 차이  
2. 응답에 CORS 헤더가 있을 때 vs 없을 때 Console 에러  
3. 쿠키가 붙은 크로스 오리진 요청의 조건 (`SameSite`, `Allow-Credentials`)

---

## 한 줄 정리

> **Origin** 으로 경계를 긋고(SOP), 필요할 때만 서버가 **명시적으로** 문을 연다(CORS).  
> 쿠키는 그 경계를 넘나드는 **자동 첨부 자격 증명** 이라 속성과 정책을 함께 본다.
