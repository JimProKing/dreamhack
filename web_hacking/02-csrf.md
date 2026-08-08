# CSRF (Cross-Site Request Forgery)

유닛 예: [webhacking-csrf](https://dreamhack.io/lecture/units/webhacking-csrf)

## 개념

피해자(여기서는 주로 **봇**)의 권한으로, 그 주체가 의도하지 않은 **요청**을 보내게 한다.

XSS가 “스크립트 실행·데이터 읽기”에 가깝다면, CSRF는 “**이미 가진 권한으로 특정 액션**”에 가깝다.

GET이면 이미지 로드만으로 요청이 나갈 수 있다.

```html
<img src="/privileged-endpoint?...">
```

## csrf-1 (#26)

| 조건 (요지) | 봇이 `/admin/notice_flag?userid=admin` 방문 |
|-------------|---------------------------------------------|
| 왜 봇인가 | `127.0.0.1` 등 내부 조건 |
| 결과 | memo에 FLAG 기록 → **`/memo` 확인** |

```html
<img src="/admin/notice_flag?userid=admin">
```

## csrf-2 (#269)

`/memo` 없음.

| 단계 | 내용 |
|------|------|
| 1 | 봇은 admin 세션으로 `/vuln` 방문 |
| 2 | `<img src="/change_password?pw=1234">` 로 비밀번호 변경 |
| 3 | **admin / 1234** 로 로그인 → 플래그 |

## 비교

| | csrf-1 | csrf-2 |
|--|--------|--------|
| 봇 행동 | notice_flag | change_password |
| 관찰 위치 | `/memo` | 로그인 성공 화면 |
