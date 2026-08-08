# XSS (Cross-Site Scripting)

유닛 예: [webhacking-xss](https://dreamhack.io/lecture/units/webhacking-xss)

## 개념

입력이 HTML에 이스케이프 없이 들어가면, 브라우저는 그 입력을 **스크립트로 실행**할 수 있다.

드림핵 입문 문제 공통 패턴:

| 구성요소 | 역할 |
|----------|------|
| `/vuln?param=` | 입력을 거의 그대로 출력 |
| `/flag` (또는 유사) | **봇**이 해당 페이지를 방문 |
| 봇 | 서버 내부 브라우저. 쿠키·admin 세션 등을 가짐 |
| 결과 채널 | memo 등, 우리가 다시 읽을 수 있는 저장소 |

내 DevTools Application에 flag 쿠키가 없는 것이 정상인 경우가 많다. 비밀은 **봇 쪽**에 있다.

## xss-1 (#28)

봇에 `flag` 쿠키가 설정된 뒤 `/vuln` 을 연다.

```html
<script>location.href="/memo?memo="+document.cookie</script>
```

| 요소 | 의미 |
|------|------|
| `document.cookie` | 봇 쿠키 문자열 |
| `location.href=...` | 그 값을 쿼리로 실어 `/memo` 로 이동 |

절차: `/flag` 제출 → `/memo` 확인.

## xss-2 (#268)

`script` 문자열이 필터된다. 태그 없이 실행을 유도:

```html
<img src=x onerror="location.href='/memo?memo='+document.cookie">
```

이미지 로드 실패 시 `onerror` 의 JS가 실행된다.

## `location.href`

현재 탭의 URL. 대입하면 **페이지 이동** (주소창 입력과 유사).
