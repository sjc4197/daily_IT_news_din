# DIN 뉴스 파일 양식 (Claude Cowork용)

## 파일 위치 / 이름
- 폴더: `news/`
- 파일명: `YYYY-MM-DD.txt` (예: `news/2026-11-05.txt`) — 하루 1개, UTF-8
- 같은 날짜 파일이 이미 있으면 덮어쓴다.

## 파일 내용
- 기사 1건 = 블록 1개. 블록 사이는 `---` 한 줄로 구분한다.
- 블록 안은 `키: 값` 한 줄씩. `summary`는 여러 줄 가능 (키 없는 줄은 바로 앞 키의 이어지는 줄로 처리).
- 키는 모두 소문자 영문. 순서는 상관없지만 아래 순서를 권장.

| 키 | 필수 | 값 |
|---|---|---|
| `title` | 필수 | 기사 제목 (한국어로 번역/요약한 제목) |
| `category` | 필수 | `AI` 또는 `IT` |
| `importance` | 필수 | `1`~`5` 정수. 5=필독, 4=중요, 3=보통, 2=참고, 1=가벼움 |
| `source` | 필수 | 매체명 (예: TechCrunch, 한국경제) |
| `url` | 필수 | 원문 링크 (http/https) |
| `summary` | 필수 | 2~3문장 한국어 요약. 왜 중요한지 한 문장 포함 |

## 예시 (`news/2026-11-05.txt`)

```
title: 오픈소스 LLM, 주요 벤치마크에서 상용 모델과 격차 1% 이내로
category: AI
importance: 5
source: 예시 매체
url: https://example.com/article/1
summary: 공개 가중치 모델이 코딩·추론 벤치마크에서 상용 최상위 모델에 근접했다.
사내 모델 선택 기준에 직접 영향을 주므로 필독.
---
title: 국내 통신 3사, 데이터센터 전력 공동 조달 계약
category: IT
importance: 3
source: 예시 매체
url: https://example.com/article/2
summary: AI 수요 급증으로 데이터센터 전력 확보가 업계 공통 과제가 됐다.
---
title: 브라우저 신버전, 서드파티 쿠키 기본 차단
category: IT
importance: 2
source: 예시 매체
url: https://example.com/article/3
summary: 웹 광고·분석 도구 영향이 있으나 당장 조치할 항목은 없다.
```

## 규칙
- 하루 5~15건 권장. `importance: 5`는 하루 1~3건 이내로 제한.
- 제목·요약은 한국어. 고유명사는 원어 유지 가능.
- `url`에는 추적 파라미터(utm_ 등)를 제거한다.
- 파일 끝의 마지막 블록 뒤에는 `---`를 쓰지 않아도 된다 (있어도 무시).
