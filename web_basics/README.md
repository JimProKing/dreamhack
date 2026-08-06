# web_basics

웹 해킹 입문 전에 잡는 **웹·브라우저·인증 상태** 노트.

| 유닛 | 강의 | 이 폴더 |
|------|------|---------|
| 웹 해킹을 위한 웹 기초 지식 | [webhacking-basic-knowledeges](https://dreamhack.io/lecture/units/webhacking-basic-knowledeges) | [01](./01-web-http-https.md), [02](./02-browser-devtools.md) |
| Cookie & Session | [webhacking-cookie-session](https://dreamhack.io/lecture/units/webhacking-cookie-session) | [03](./03-cookie-session.md), [04](./04-sop-cors.md) |

상위 맵: [../README.md](../README.md)  
일자 로그: [../log_for_study/2026-08-06.md](../log_for_study/2026-08-06.md)

---

## 목차

| # | 노트 | 핵심 |
|---|------|------|
| 1 | [01-web-http-https.md](./01-web-http-https.md) | 웹 구성, HTTP/HTTPS, 요청·응답 |
| 2 | [02-browser-devtools.md](./02-browser-devtools.md) | 브라우저 역할, URL/DNS, DevTools |
| 3 | [03-cookie-session.md](./03-cookie-session.md) | 쿠키·세션, 인증 상태, 흔한 실수 |
| 4 | [04-sop-cors.md](./04-sop-cors.md) | Same-Origin Policy, CORS |

---

## 연결된 연습 (유닛 내 Exercise)

| 문제 | 영역 | 노트 연결 |
|------|------|-----------|
| [devtools-sources (#267)](https://dreamhack.io/wargame/challenges/267) | DevTools Sources | [02](./02-browser-devtools.md) |
| [cookie (#6)](https://dreamhack.io/wargame/challenges/6) | 쿠키 인증 | [03](./03-cookie-session.md) |
| [session-basic (#409)](https://dreamhack.io/wargame/challenges/409) | 쿠키 + 세션 | [03](./03-cookie-session.md) |

문제 단위 풀이 폴더는 필요할 때 `war_game/` 에 추가.

---

## 왜 이 순서인가

```text
웹이 무엇인가 (HTTP)
  → 브라우저가 요청을 어떻게 보내고 응답을 그리는가
  → 상태가 없는 HTTP 위에 쿠키·세션으로 로그인 상태를 얹는 법
  → 다른 출처(origin) 스크립트가 그 상태에 손대지 못하게 하는 SOP/CORS
```

웹 문제 대부분은 **요청/응답을 보고, 클라이언트가 들고 있는 값(쿠키·스토리지·JS)을 의심**하는 습관에서 시작한다.
