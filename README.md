# THUNDER-ELEVEN-iOS
솝커톤 다 부셔버릴 Team ⚡️THUNDER ELEVEN⚽️ 아요들 ㅋㅋ

# 그래미 : 그래, 이게 나야!
```
 태그로 보는 우리들의 인상 😃
```

# 2차 과제 추가 제출
## 플로우차트
![1](https://user-images.githubusercontent.com/109775321/202874987-c8531974-5d7e-464e-9b1f-def1a1d2e6d6.png)
![2](https://user-images.githubusercontent.com/109775321/202874989-5342abdd-4ac6-433d-8662-d5bdcb483152.png)
```
와이어프레임에서 발전하여, 뷰들을 상세화시켰고, 
플로우차트를 구체화하여 화면간의 이동을 가능하게 하였다.
모든 뷰에 구현하진 못 했지만 서버에서 받아온 데이터를 사용하여 뷰를 구현할 수 있게 하였다.
헤더에 토큰을 넣어주어서 로그인이 가능하게 하였다!
```

## 간단한 설명
![Untitled](https://user-images.githubusercontent.com/109775321/202875004-f43ea050-214a-4a0f-b72f-b58e0fa08de3.png)
```
위 뷰와 함께 플로우차트를 살펴보면 
초기 로그인 화면에서 유저가 로그인을 하게되면 
탭 뷰가 3개인 화면으로 넘어가게 된다.
프로필 뷰에서는 대표적인 내 첫인상, 현인상을 나타내고
인상리스트 탭 뷰에서는 나에게 인상을 남겨준 유저들과, 해당 인상리스트들의 요약본을 확인할 수 있고,
 셀을 선택하게되면 해당 유저가 나에게 남긴 모든 인상들을 볼 수 있다.
세번째 탭에서는 유저의 아이디를 검색해서 원하는 유저에게 인상 코멘트를 남길 수 있다
```

## 구현 시 어려웠던 부분과 해결 방법
* 

# 1차 과제
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

