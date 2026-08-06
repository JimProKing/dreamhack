# 2. 웹 브라우저 · DevTools

- 유닛: [웹 해킹을 위한 웹 기초 지식](https://dreamhack.io/lecture/units/webhacking-basic-knowledeges)
- 관련: Background: Web Browser, Tools: Browser DevTools  
- 연습: [devtools-sources (#267)](https://dreamhack.io/wargame/challenges/267)

## 브라우저가 하는 일

1. 주소창/링크 → **URL** 해석  
2. **DNS** 로 호스트 → IP  
3. TCP(+TLS) 연결 후 **HTTP 요청**  
4. 응답 HTML 파싱 → DOM 구성  
5. CSS·JS·이미지 등 **추가 요청**  
6. JS 실행, 이벤트 처리, 화면 갱신  

해킹·디버깅에서는 “페이지가 예쁘게 보이는지”보다  
**어떤 요청이 나갔고, 어떤 스크립트·쿠키가 붙었는지** 를 본다.

---

## URL

```text
https://user:pass@example.com:443/path/to?x=1&y=2#section
│       │         │          │    │        │        │
│       │         호스트      포트  경로     쿼리     프래그먼트
│       (거의 안 씀)
스킴 (http / https)
```

| 부분 | 보안에서 |
|------|----------|
| 스킴 | `http` vs `https` — 전송 보호 |
| 호스트 | 쿠키 Domain, CORS Origin 과 연결 |
| 경로 | 라우팅, 권한 검사 단위 |
| 쿼리 | `GET` 파라미터. 로그·Referer 에 남을 수 있음 |
| 프래그먼트 `#` | **서버로 안 감**. 클라이언트(JS)만 사용 |

---

## DNS (Domain Name System)

사람이 읽는 도메인 → IP 주소 변환.  
브라우저/OS 가 캐시한다. 웹 해킹 입문 단계에서는 “호스트 이름이 어디로 연결되는지” 정도만 알아도 충분.

---

## Chrome DevTools

열기: `F12` / `Ctrl+Shift+I` (Windows·Linux) · `Cmd+Option+I` (macOS)  
또는 페이지 우클릭 → **검사**.

| 패널 | 용도 |
|------|------|
| **Elements** | DOM·CSS. 보이는 HTML 구조, 속성 확인·임시 수정 |
| **Console** | JS 실행·로그. 변수 확인, 간단 스크립트 |
| **Sources** | 로드된 JS/HTML 파일, 브레이크포인트, **숨긴 파일·주석** |
| **Network** | 요청·응답 목록, 헤더, 바디, 쿠키, 타이밍 |
| **Application** | Cookie, Local/Session Storage, 캐시 |
| **Security** | HTTPS·인증서 요약 |

### 웹 문제에서 자주 쓰는 순서

```text
1. Network  — 로그인·폼 제출 시 실제 요청 확인
2. Application → Cookies / Storage — 클라이언트가 들고 있는 값
3. Sources  — JS 안에 하드코딩된 시크릿, 숨은 파일, 난독화 전 로직
4. Console  — document.cookie, 간단한 호출 실험
```

### Network 탭 포인트

- 녹화는 DevTools 가 **열려 있을 때** 부터인 경우가 많음 → 필요하면 새로고침  
- 요청 클릭 → **Headers** (요청/응답 헤더), **Payload**, **Response**, **Cookies**  
- `Set-Cookie` 는 응답, 이후 요청의 `Cookie` 헤더로 돌아감  

### Sources 탭 포인트

- 왼쪽 트리: 도메인별 스크립트·맵 파일  
- 주석, 백업 파일, source map, 개발용 엔드포인트가 남아 있는 경우  
- 연습 문제 [devtools-sources](https://dreamhack.io/wargame/challenges/267): **Sources 에서 숨겨진 리소스/코드를 찾는** 유형

### Application → Cookies

| 열 | 의미 |
|----|------|
| Name / Value | 이름과 값 (위조·변조 실험 대상) |
| Domain / Path | 어떤 요청에 붙는지 |
| HttpOnly | JS 의 `document.cookie` 로 **못 읽음** |
| Secure | HTTPS 에서만 전송 |
| SameSite | 크로스 사이트 전송 제한 (Lax/Strict/None) |
| Expires / Max-Age | 만료. Session cookie 면 브라우저 종료 시 삭제(관례) |

---

## 관찰 습관 (한 줄)

> 화면이 아니라 **요청·쿠키·스크립트** 를 본다.
