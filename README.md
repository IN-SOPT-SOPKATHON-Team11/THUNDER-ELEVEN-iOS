# THUNDER-ELEVEN-iOS
솝커톤 다 부셔버릴 Team ⚡️THUNDER ELEVEN⚽️ 아요들 ㅋㅋ

# 그래미 : 그래, 이게 나야!
```
 태그로 보는 우리들의 인상 😃
```
## 컨벤션

- **소통 방식**
    
    ```swift
    새로운 기능을 하는 코드를 썼을 때
    ///로 커멘트 달아서 PR 시간 줄이기
    ```
    
- **커밋 - [Feat] 커밋 메시지**
    
    ```swift
    [Feat] 새로운 주요 기능 추가
    [Add] 파일 추가, 에셋 추가, etc...
    [Fix] 버그 수정
    [Del] 쓸모없는 코드, 뭐 어쩌고 삭제
    [Chore] 그냥 기타 작업 
    ```
    
- **브런치명 - feat/작업이름-닉네임**
    
    ```swift
    feat/MainViewUI-Dam
    ```
    
- **PR명 - [Feat]**
    
    ```swift
    [Feat] 작업 요약 제목
    ```

- **코드 컨벤션**
  ```swift
  // 버튼명 + DidTap
  @IBAction func backButton**DidTap**() {
    // ...
  }

  // Default - 약어 없이
  뷰컨트롤러명 - ViewController 그대로

  /// 함수 설명
  func newFunction() {
    // ...
  }
  ```
  
  ## 프로젝트 폴더링

  ```bash
  ├── Resource
  │   ├── Assets
  │   │   └── Assets.xcassets
  │   ├── Colors
  │   │   └── Color.xcassets
  │   └── Storyboards
  │       └── LaunchScreen.storyboard
  ├── Source
  │   ├── Application
  │   │   └── AppDelegate.swift
  │   │   └── SceneDelegate.swift
  │   └── Common
  │   │   └── Consts
  │   │   │   └── Const.swift
  │   │   │   └── ViewController.swift
  │   │   │   └── Identifier.swift
  │   │   │   └── Image.swift
  │   │   └── Extensions
  │   │       └── UIImageView+.swift
  │   │       └── UIImage+.swift
  │   │       └── UILabel+.swift
  │   │       └── UIFont+.swift
  │   │       └── BaseNavigationController.swift
  │   └── Presentation
  │   │   └── AppTabBarController.swift
  │   │   └── Main
  │   │       └── AppTabBarController.swift
  │   └── Service
  │       └── Data
  │       │   └── Main
  │       └── Network
  │       │   └── Main
  │       └── NetworkAPI
  │
  └── Info.plist
  ```

## 화면 전환 플로우

![Untitled](https://user-images.githubusercontent.com/75439868/202864459-71a0ea6e-593c-4c2d-a19a-a630717914b7.png)

## UI 구조 스케치
![Frame 1 (2)](https://user-images.githubusercontent.com/109775321/202874870-df89261f-955a-4697-8394-90fa20610831.png)



## 멤버 소개
### 🥊 담인
- 닉네임 입력
- 인상 남기기
- 완료
### ⚡️ 정연
- 로그인
### ⚽️ 서린
- 유저 상세
- 프로필
### 🥅 채은
- 유저별 로그 리스트


![7712945](https://user-images.githubusercontent.com/75439868/202626809-ee310f5f-18fb-4b1d-8d2d-e87c46ca4aa1.jpeg)

