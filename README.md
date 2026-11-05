# DIN · Daily IT News

매일 아침 Claude Cowork가 IT/AI 뉴스를 스크랩해 `news/YYYY-MM-DD.txt`로 푸시하면,
GitHub Pages의 `index.html`이 그 폴더를 읽어 날짜별로 보여주는 페이지입니다.

- 페이지: https://sjc4197.github.io/daily_IT_news_din/
- 파일 양식: [FORMAT.md](FORMAT.md)

## 구조

```
index.html        페이지 (빌드 없음, 정적 1파일)
news/
  2026-11-05.txt  하루 1파일
  2026-11-04.txt
FORMAT.md         txt 양식 (Cowork에게 이 파일을 읽게 하면 됨)
```

## 동작 방식

1. 페이지가 GitHub API로 `news/` 폴더의 파일 목록을 가져온다. (별도 인덱스 파일·빌드 불필요)
2. 선택한 날짜의 txt를 읽어 기사 블록으로 파싱한다.
3. 중요도(5→1) 순으로 정렬해 표시한다. 분류(AI/IT)·중요도 필터, 전체 날짜 검색, `#2026-11-05` 식 날짜 링크 지원.

새 txt를 `main`에 푸시하면 Pages 반영 후 바로 보인다. 다른 파일은 손댈 필요 없다.

## Claude Cowork 지시문 예시

```
매일 아침 IT/AI 뉴스를 스크랩해서 이 레포의 news/ 폴더에 저장하고 푸시해줘.
- 파일명은 오늘 날짜로 news/YYYY-MM-DD.txt
- 양식은 FORMAT.md를 그대로 따라. 기사 사이는 --- 한 줄로 구분.
- 기사 5~15건, category는 AI 또는 IT, importance는 1~5 (5=필독은 하루 3건 이내).
- title/summary는 한국어, url은 원문 링크(utm 파라미터 제거).
- 저장 후 git add → commit("news: YYYY-MM-DD") → push origin main.
```

## 로컬 미리보기

```
python -m http.server 8000
```
브라우저에서 http://localhost:8000 (파일을 fetch로 읽으므로 더블클릭으로 열면 안 됨)

## 배포

GitHub Pages: Settings → Pages → Source `main` / root. `.nojekyll` 포함.
