# web_hacking

웹 **취약 유형** 정리.  
HTTP·쿠키 등 기반은 [web_basics/](../web_basics/), 일자별 맥락은 [log 2026-08-07](../log_for_study/2026-08-07.md).

| # | 주제 | 노트 | 대표 문제 |
|---|------|------|-----------|
| 1 | XSS | [01-xss.md](./01-xss.md) | #28, #268 |
| 2 | CSRF | [02-csrf.md](./02-csrf.md) | #26, #269 |
| 3 | 파일 | [03-file.md](./03-file.md) | #38, #37 |
| 4 | 주입 (SQL / NoSQL) | [04-injection.md](./04-injection.md) | #24, #90 |
| 5 | SSRF | [05-ssrf.md](./05-ssrf.md) | #75 |

```text
클라이언트:  브라우저에서 스크립트·요청 (XSS, CSRF)
서버 파일:   업로드 실행 / 경로 조작 읽기
서버 질의:   SQL·NoSQL에 입력이 구조로 섞임
서버 요청:   내부 URL을 서버가 대신 호출 (SSRF)
```
