<div align="center">
<a href="https://blog.rgbplace.com"><img alt="RGB Place" src="https://github.com/6lueparr0t/rgbplace-about/blob/master/assets/img/RGB_place.png" width="75%"></a>
</div>

# RGB place

지역 커뮤니티 사용자들을 위한 플랫폼

## Details

### 백엔드

- **스택**: PHP (CodeIgniter), MariaDB
- **기능**:
  - 사용자 인증 및 권한 관리
  - 커뮤니티 게시물 CRUD (생성, 읽기, 업데이트, 삭제)
  - 위치 기반 데이터 관리

### 프론트엔드

- **스택**: Vanilla JS, Scss, GulpJS
- **디자인**:
  - Vanilla JS와 Scss 사용: 초기에는 React를 고려했으나, 프로젝트 규모 및 복잡성으로 인해 필요성이 낮다고 판단하여 Vanilla JS와 Scss로 설계
  - 빌드 툴: GulpJS를 사용하여 빌드 및 배포 프로세스 자동화

### OAuth 2.0 로그인

- **지원 플랫폼**: 네이버, 카카오, 구글
- **설명**: 사용자들이 각자의 소셜 계정을 사용하여 로그인할 수 있도록 OAuth 2.0 인증 구현

### 구글 맵 API

- **설명**: 사용자 위치 기반 서비스 제공
- **제한 사항**: 과금 이슈로 인해 제한적 사용

### 실시간 기능

- **스택**: Golang, WebSocket
- **기능**:
  - 실시간 접속: 사용자 간 실시간 접속 상태 구현
  - 실시간 알림: 부분적으로 구현되어 있으며, 중요한 알림을 실시간으로 전송

### Markdown 에디터

- **스택**: CodeMirror
- **설명**: velog를 참고하여 Markdown 에디터를 직접 구현하여 사용자들이 포맷된 글을 작성할 수 있도록 함

### Push State

- **설명**: 브라우저 히스토리 관리에 Push State를 부분적으로 적용하여 사용자 경험 개선

## 성과

- 효율적인 기술 선택: 프로젝트 요구 사항에 맞는 최적의 기술 스택을 선택하여 개발 효율성을 극대화
- 실시간 서비스 제공: Golang과 WebSocket을 이용한 실시간 기능 구현을 통해 사용자 경험 향상
- 소셜 로그인 통합: 다양한 소셜 플랫폼의 OAuth 2.0 인증을 통합하여 사용자 편의성 증대

## 링크

- [Codigniter 한국 사용자 포럼](https://www.cikorea.net/bbs/view/ci_make?idx=20775&page=1&view_category=&lists_style=)

## 이미지

![](/image/1.jpg)

![](/image/2.png)

![](/image/3.png)

![](/image/4.jpg)
