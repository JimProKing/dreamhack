# Dreamhack Learn

[강의 홈](https://dreamhack.io/lecture) · [Path 목록](https://dreamhack.io/lecture/paths) · [Unit 목록](https://dreamhack.io/lecture/units)

드림핵 학습 구조를 로컬에서 찾기 쉽게 정리한 허브.  
세부 필기·워게임 풀이는 아래 **로컬 폴더**와 `war_game/`, `log_for_study/` 에 둔다.

---

## 플랫폼 구조

| 단위 | 설명 |
|------|------|
| **Path** | 주제별 커리큘럼 (유닛 묶음). Skill Path / Job Role Path |
| **Unit** | Path 안의 한 단원. 강의·퀴즈·Lab·Exercise(워게임) 조합 |
| **Lecture** | 읽을 강의 본문 |
| **Quiz** | 객관식 등. **제출·통과**해야 진도에 잡히는 경우가 많음 |
| **Lab** | 실습. **전체 진도(%)에 포함되지 않음** (안내 문구 기준) |
| **Exercise / Wargame** | 실전 문제. 유닛에 묶인 경우 플래그 제출이 완료 조건일 수 있음 |

### 진도·완료 표시 (불)

| 상황 | 해석 |
|------|------|
| Lab만 끝냄 | 진도 불 안 들어와도 정상 |
| 퀴즈 미제출 | 미완료로 남을 수 있음 |
| Pro / Excluded | 멤버십·잠금 항목은 집계에서 빠지거나 완료 불가 |
| 내용만 읽고 끝 | “이해함” ≠ 시스템 완료. Quiz/Exercise 확인 |

자세한 체감: 이전에 정리한 대로 **Lab·잠금은 불이 안 들어와도 이상한 경우가 많다.**

---

## 카테고리 (Path 필터)

드림핵 Path 목록 기준 대분류:

| 분야 | 다루는 것 |
|------|-----------|
| Beginners | 입문, 리눅스, 환경, 팁 |
| Web Hacking | HTTP, 인증, 클라이언트·서버 취약점 |
| System Hacking | 메모리 손상, 익스플로잇, 커널 등 |
| Reverse Engineering | 바이너리 분석, Ghidra, 어셈 |
| Cryptography | 고전·현대 암호, 프로토콜 |
| Digital Forensics | 포렌식 |
| Mobile / Cloud / Blockchain / Hardware / AI | 각 도메인 특화 |
| Secure Coding | 안전한 구현 |

전체 Path는 수십 개. 아래는 **입문~중급에서 자주 쓰는 축**과 로컬 노트 연결.

---

## Path 지도 (우선 축)

### Beginners / 기반

| Path | 링크 | 로컬 | 상태 |
|------|------|------|------|
| Linux 101 | [path](https://dreamhack.io/lecture/paths/linux-101) | [linux_101/](../linux_101/) | 완료 |
| Security Awareness Training | [path](https://dreamhack.io/lecture/paths/security-awareness-training) | [security_awareness/](../security_awareness/) | 완료 |
| Dream Beginners | [path](https://dreamhack.io/lecture/paths/dream-beginners) | (미작성) | — |
| Tips / 기초 도구 | 유닛 [tips-make-life-easier](https://dreamhack.io/lecture/units/tips-make-life-easier) | [log 08-04](../log_for_study/2026-08-04.md) | 부분 |

### Web

| 주제 | 유닛·Path 예 | 로컬 |
|------|----------------|------|
| 웹·HTTP·브라우저 | [webhacking-basic-knowledeges](https://dreamhack.io/lecture/units/webhacking-basic-knowledeges) | [web_basics/](../web_basics/) |
| 쿠키·세션·SOP | [webhacking-cookie-session](https://dreamhack.io/lecture/units/webhacking-cookie-session) | [web_basics/03–04](../web_basics/) |
| XSS | [webhacking-xss](https://dreamhack.io/lecture/units/webhacking-xss) | [web_hacking/01-xss](../web_hacking/01-xss.md) |
| CSRF | [webhacking-csrf](https://dreamhack.io/lecture/units/webhacking-csrf) | [web_hacking/02-csrf](../web_hacking/02-csrf.md) |
| 파일 취약 | File Vulnerability 관련 유닛 | [web_hacking/03-file](../web_hacking/03-file.md) |
| SQLi / Blind / NoSQL | SQL·NoSQL Injection 유닛 | [web_hacking/04-injection](../web_hacking/04-injection.md) |
| SSRF | SSRF 유닛 | [web_hacking/05-ssrf](../web_hacking/05-ssrf.md) |
| 웹 입문 Path 묶음 | Web Hacking Fundamental 계열 | 위 노트 + [log 08-07](../log_for_study/2026-08-07.md) |

### System / Reverse (다음 후보)

| Path | 링크 | 비고 |
|------|------|------|
| System Hacking (fundamental) | [path](https://dreamhack.io/lecture/paths/system-hacking-fundamental) | 스택 버퍼 오버플로 등. 리눅스 101 이후 |
| System Hacking Linux Advanced | [path](https://dreamhack.io/lecture/paths/system-hacking-advanced) | 심화 |
| How to Use Ghidra | [path](https://dreamhack.io/lecture/paths/reverse-engineering-ghidra) | 리버싱 입문 |
| Linux Kernel Hacking Basics | [path](https://dreamhack.io/lecture/paths/linux-kernel-hacking-basic) | 상위 |
| Tool: GDB (관련 유닛) | Learn에서 gdb 검색 | 로컬 노트 [gdb/](../gdb/) |

### 기타 (나중에)

Cryptography, Cloud (AWS/GCP/Azure/K8s), Mobile (iOS/Frida), Blockchain, Hardware, AI 등 — [Path 목록](https://dreamhack.io/lecture/paths)에서 Tier·난이도로 필터.

---

## 이 레포와의 대응

| 로컬 | 드림핵에서 | 역할 |
|------|------------|------|
| `log_for_study/` | — | 그날 한 일, 시행착오 |
| `linux_101/` | Linux 101 Path | 시스템 관찰 기초 |
| `gdb/` | Tool: gdb 등 | 디버거·메모리 관찰 |
| `web_basics/` | 웹 기초·쿠키 유닛 | 프로토콜·브라우저·인증 상태 |
| `web_hacking/` | 웹 취약 유닛·Exercise | 취약 유형별 메커니즘·절차 |
| `security_awareness/` | Security Awareness Path | 인식·예방·대응 |
| `war_game/` | Wargame / Exercise | 문제 단위 산출물 |
| `lecture/` | Learn 전체 | **지도·진도 규칙·추천 순서** (이 폴더) |

---

## 권장 학습 순서 (현재 진도 기준)

이미 한 것: Linux 101, 웹 기초·입문 취약 한 바퀴, Security Awareness.

```text
[완료] 보안 인식 Path
[완료] Linux 101
[완료] 웹 기초 + 클라이언트/서버 취약 입문
[정리] GDB 노트 (gdb/)
        │
        ▼
  A) GDB 손에 익히기 + System Hacking Fundamental
  B) 웹 심화 (Blind advanced, WAF 등)
  C) Ghidra / 리버싱 입문
```

하루 단위로는 **Path 하나 안의 유닛 1~2개** 또는 **워게임 1~2문제**가 무리 없음.

---

## 공부할 때 체크리스트

1. Path/유닛 페이지에서 Lecture · Quiz · Lab · Exercise 개수 확인  
2. Lab은 연습용 — 불(진도)과 무관할 수 있음  
3. Quiz·워게임은 제출까지  
4. 이해한 내용은 로컬 노트에 **메커니즘 + 절차**로 옮김  
5. 인스턴스 포트·HOST는 커밋하지 않음  

---

## 바로가기

- [Learn](https://dreamhack.io/lecture)  
- [Paths](https://dreamhack.io/lecture/paths)  
- [Wargame](https://dreamhack.io/wargame/)  
- 로컬: [web_hacking/](../web_hacking/) · [linux_101/](../linux_101/) · [security_awareness/](../security_awareness/) · [war_game/](../war_game/)
