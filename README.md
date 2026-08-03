# Dreamhack 공부

드림핵 강의랑 워게임 풀면서 정리하는 레포.

시작일: 2026-08-03

---

## 폴더 구조

```
.
├── war_game/           # 워게임 풀이 코드
│   ├── addition-quiz_1114/
│   └── flag-shop_1874/
└── log_for_study/      # 날짜별 공부 정리
```

---

## 일자별 공부

### 2026-08-03

- pwntools 기본 사용법 정리 (process/remote, send/recv, packing, context 등)
- 워게임
  - addition-quiz (#1114) — 덧셈 50번, 시간 제한 → 스크립트로 자동화
  - flag-shop (#1874) — 섞인 목록에서 flag 인덱스 50번 맞히기
- 자세한 메모: [log_for_study/2026-08-03.md](log_for_study/2026-08-03.md)

---

## 실행 방법

```bash
# 가상환경 (처음 한 번)
python3.12 -m venv venv
source venv/bin/activate
pip install pwntools

# 풀이 실행 (호스트/포트는 드림핵 인스턴스에 맞게 수정)
python war_game/addition-quiz_1114/solve.py
python war_game/flag-shop_1874/solve.py
```

---

## 링크

- [Dreamhack](https://dreamhack.io/)
- [Wargame](https://dreamhack.io/wargame/)
