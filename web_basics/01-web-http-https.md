# 1. 웹 · HTTP / HTTPS

- 유닛: [웹 해킹을 위한 웹 기초 지식](https://dreamhack.io/lecture/units/webhacking-basic-knowledeges)
- 관련: Background: Web, Background: HTTP/HTTPS, Lab: HTTP Request & Response

## 웹이란

브라우저와 서버가 **문서·API·리소스**를 주고받는 시스템.

| 구성 | 역할 |
|------|------|
| **클라이언트** | 주로 웹 브라우저. 요청을 보내고 응답을 해석·표시 |
| **서버** | HTTP 요청을 받아 처리하고 응답(HTML, JSON, 파일 등) |
| **프로토콜** | 둘 사이 약속 — 웹에서는 주로 **HTTP/HTTPS** |
| **리소스** | URL 로 가리키는 페이지, 이미지, 스크립트, API 결과 |

초기 웹은 정적 문서 위주였고, 지금은 동적 페이지·SPA·REST API 등 **요청마다 다른 응답**이 일반적이다.

---

## HTTP (HyperText Transfer Protocol)

애플리케이션 계층 프로토콜. **요청(Request) → 응답(Response)** 한 쌍이 기본 단위.

### 특징

| 특징 | 의미 | 보안/해킹에서 |
|------|------|----------------|
| **무상태 (stateless)** | 서버가 이전 요청을 기본으로 기억하지 않음 | 로그인 상태를 **쿠키·세션**으로 별도 유지 |
| **텍스트 기반 헤더** | 사람이 읽을 수 있는 헤더 + 바디 | DevTools / 프록시로 그대로 관찰 가능 |
| **메서드** | 요청의 “의도” (`GET`, `POST`, …) | 같은 URL 이라도 메서드·바디에 따라 동작 다름 |

### 요청 (Request) 구조

```text
GET /login HTTP/1.1
Host: example.com
User-Agent: ...
Cookie: sessionid=abc
Content-Type: application/x-www-form-urlencoded

username=admin&password=...
```

| 부분 | 설명 |
|------|------|
| 시작줄 | 메서드 + 경로(+쿼리) + HTTP 버전 |
| 헤더 | `Host`, `Cookie`, `Content-Type`, `User-Agent` 등 |
| 바디 | `POST` 등에서 폼·JSON. `GET` 은 보통 없음 |

### 응답 (Response) 구조

```text
HTTP/1.1 200 OK
Content-Type: text/html; charset=utf-8
Set-Cookie: sessionid=abc; HttpOnly; Path=/

<html>...</html>
```

| 부분 | 설명 |
|------|------|
| 상태줄 | 버전 + **상태 코드** + 이유 문구 |
| 헤더 | `Content-Type`, `Set-Cookie`, `Location` 등 |
| 바디 | HTML, JSON, 파일 바이트 등 |

### 자주 보는 상태 코드

| 코드 | 의미 | 메모 |
|------|------|------|
| **200** | OK | 성공 |
| **301 / 302** | Redirect | `Location` 으로 이동 |
| **400** | Bad Request | 클라이언트 요청 형식 문제 |
| **401** | Unauthorized | 인증 필요·실패 |
| **403** | Forbidden | 권한 없음 |
| **404** | Not Found | 리소스 없음 |
| **500** | Server Error | 서버 쪽 오류 (정보 노출 주의) |

### 메서드

| 메서드 | 용도 (관례) |
|--------|-------------|
| `GET` | 조회. URL·쿼리에 실림. 북마크·캐시 대상 |
| `POST` | 생성·제출. 바디에 데이터 |
| `PUT` / `PATCH` | 수정 |
| `DELETE` | 삭제 |
| `OPTIONS` | CORS preflight 등 허용 메서드 확인 |

---

## HTTPS

**HTTP + TLS(암호화)**. 도청·중간자 변조를 어렵게 한다.

| 항목 | HTTP | HTTPS |
|------|------|--------|
| 기본 포트 | 80 | 443 |
| 전송 내용 | 평문 | 암호화 |
| 인증서 | 없음 | 서버 신원 검증 (브라우저 경고) |

웹 보안에서 HTTPS 는 **전송 구간** 보호다.  
앱 로직 버그(쿠키 위조, XSS, 권한 검사 누락)는 HTTPS 만으로 해결되지 않는다.

---

## Lab 관점: 요청·응답 관찰

실습·워게임에서 반복하는 것:

1. 브라우저가 **어떤 URL·메서드**로 보냈는지  
2. 요청 헤더에 **Cookie / Authorization** 이 있는지  
3. 응답 **상태 코드·Set-Cookie·바디** 가 무엇인지  
4. 같은 동작을 다른 파라미터로 반복했을 때 무엇이 바뀌는지  

도구: Chrome DevTools **Network** 탭 (다음 노트), 이후 Burp 등 프록시.
