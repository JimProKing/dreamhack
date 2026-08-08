# Security Awareness Training

[Dreamhack Path](https://dreamhack.io/lecture/paths/security-awareness-training) 정리.

해킹 “기술” 전에, **사고가 일상에서 어떻게 시작되는지 / 어떻게 막는지 / 터지면 어떻게 하는지** 쪽.

상위 맵: [../README.md](../README.md)

**상태:** Path 완료 (2026-08-08)

---

## 유닛

| # | 유닛 | 강의 | 노트 |
|---|------|------|------|
| 1 | 정보보안이란 | [about-Information-security](https://dreamhack.io/lecture/units/about-Information-security) | [01-information-security.md](./01-information-security.md) |
| 2 | 사회공학 | [social-engineering](https://dreamhack.io/lecture/units/social-engineering) | [02-social-engineering.md](./02-social-engineering.md) |
| 3 | 악성코드·랜섬웨어 | [malware-and-ransomware](https://dreamhack.io/lecture/units/malware-and-ransomware) | [03-malware-ransomware.md](./03-malware-ransomware.md) |
| 4 | 계정·인증 | [account-security-and-authentication](https://dreamhack.io/lecture/units/account-security-and-authentication) | [04-account-auth.md](./04-account-auth.md) |
| 5 | AI·LLM 보안 | [ai-and-llm-security](https://dreamhack.io/lecture/units/ai-and-llm-security) | [05-ai-llm-security.md](./05-ai-llm-security.md) |
| 6 | 데이터 보안 | [data-security](https://dreamhack.io/lecture/units/data-security) | [06-data-security.md](./06-data-security.md) |
| 7 | 물리 보안 | [physical-security](https://dreamhack.io/lecture/units/physical-security) | [07-physical-security.md](./07-physical-security.md) |

Lab (Path 안): IDOR · 피싱 예방 · 비밀번호 관리  
일자 로그: [../log_for_study/2026-08-08.md](../log_for_study/2026-08-08.md)

---

## 이 Path에서 잡는 것

| 주제 | 한 줄 |
|------|--------|
| 정보보안 | 보호 대상·위협·대책. 기술만이 아님 |
| 사회공학 | 사람 심리를 뚫는 쪽. 피싱 등 |
| 악성코드 | 어떻게 들어오고, 걸렸을 때 뭐 하나 |
| 계정 | 인증·비밀번호·다중 인증 |
| AI/LLM | 생성형 AI 위협, 안전한 사용 |
| 데이터 | 저장·공유·삭제, 협업·사내 |
| 물리 | 출입, 자리, 매체, 테일게이팅 등 |

워게임(XSS·SQLi…)이 “구멍 파기”면, 여기는 **구멍이 생기게 하는 일상 행동** 쪽.

---

## 기술 공부랑 연결

| 여기 | 레포 다른 곳 |
|------|----------------|
| 피싱·사회공학 | 웹: 가짜 로그인, CSRF 맥락 |
| 계정·세션 | [`web_basics/03-cookie-session`](../web_basics/03-cookie-session.md) |
| IDOR Lab | 권한 검사 누락 — 웹 인가 문제와 같은 뿌리 |
| 악성코드·실행 | 파일 업로드·웹쉘 위험과 맞닿음 |
| 데이터 유출 | SSRF·다운로드 취약 결과와 맞닿음 |
