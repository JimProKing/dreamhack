# 4. 계정 보안 · 인증

- 유닛: [Account Security and Authentication](https://dreamhack.io/lecture/units/account-security-and-authentication)
- Lab: Password Management · Quiz 포함

## 인증 vs 인가

| 용어 | 질문 |
|------|------|
| 인증 (Authentication) | **너가 그 사람 맞아?** |
| 인가 (Authorization) | **그 사람 이거 해도 돼?** |

로그인 성공 ≠ 모든 데이터 접근 OK.  
(IDOR Lab: 인증은 됐는데 인가가 빠진 예.)

## 비밀번호

| 피하기 | 지향 |
|--------|------|
| 재사용 | 서비스마다 다르게 |
| `password1`, 생일 | 길고 예측 어렵게 |
| 메모장 평문 방치 | 패스워드 매니저 |

유출 DB 대조(크리덴셜 스터핑) 때문에 **재사용**이 특히 위험.

## 다중 인증 (MFA / 2FA)

비밀번호 + 다른 요소 (OTP, 앱, 하드웨어 키 등).  
피싱에 완전 무적은 아니지만, 비번만 털렸을 때 버팀목.

## 웹 공부랑 연결

| 여기 | `web_basics` / 워게임 |
|------|------------------------|
| 세션·쿠키 | 로그인 상태 유지 방식 |
| 세션 탈취·고정 | XSS, 쿠키 플래그 |
| 약한 비밀 | 워게임 admin 비번 추측·NoSQL 글자 맞추기 |

---

## 한 줄

> 계정 = **인증 강도 + 재사용 여부 + (가능하면) MFA**. 인가 검사는 그다음 층.
