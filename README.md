# iOS Signup & Login Application
### 회원가입 및 로그인 기능을 구현한 프로젝트
[Ground Rule](https://github.com/GREENOVER/ios-signup-flow/blob/main/GroundRule.md)
***
#### What I learned✍️
- AutoLayout
- Navigation
- @available
- Model
- Optional
- Singleton
- GestureRecognizer
- Selector
- Assets
- UIImagePickerController
- UIDatePicker
- Extension
- final & private

#### What have I done🧑🏻‍💻
- StoryBoard에서의 오토레이아웃을 설정해보았다.
- 네비게이션과 모달의 화면 이동 방식에 대해 이해하고 구현해보았다.
- 기기 버전에 맞도록 AppDelegate와 SceneDelegate에서 코드 설정을 해주며 차이를 이해했다.
- MVC 패턴을 학습하여 모델/뷰/컨트롤러를 정의하고 구현해보았다.
- 옵셔널의 사용과 guard let, 강제추출의 차이를 이해하고 적용해보았다.
- 싱글턴 패턴을 학습하고 모델을 싱글턴 클래스로 구현하고 사용하였다.
- 탭과 터치 제스처에 대해 시스템 성능과 반응 차이에 대해 학습하고 탭제스쳐를 구현해보았다.
- 액션에 대한 Selector 메서드를 이해하고 구현해보았다.
- 에셋에 대해 학습하고 이미지를 넣어 사용해보았다.
- 이미지피커 기능을 통해 사진첩에서 사진을 선택하고 수정할 수 있도록 구현해보았다.
- 회원가입 시 다양한 정보에 대한 입력 유효성 체크를 메서드로 분리하여 구현하였다.
- Extension을 학습하여 늘어나는 기능에 대해 따로 분리하여 구현하였다.
- final과 private 등등 접근제어에 대해 학습하고 적절히 사용해보았다.
   - final: 해당 키워드를 붙여 오버라이드를 금지시켜 재정의할 필요가 없을때 사용하며 성능상 이점
   - private: 해당 키워드가 붙은 메서드를 해당 파일 내에서만 호출이 가능

#### Trouble Shooting👨‍🔧






#### Thinking Point🤔
- 고민점 (1)
  - "유저 정보를 담은 UserInforamtion에서 아래 사용자 정보 체크 기능을 수행할 필요하 있을까요?"
  ```swift
  func isSame(password: String, checkPassword: String) -> Bool
  ```
- 원인 및 대책
  - 처음 유저정보를 싱글턴으로 구현해봐서 헷갈린 포인트였는데 유저정보를 담은 인스턴스가 해당 기능을 할 필요는 없다고 느껴져 체크하는 기능을 VC에서 하도록 하였다. 유저정보 싱글턴 클래스는 딱 유저정보만을 담고 있는것이 명확하고 해당 유저정보들을 활용하여 패스워드 체크 / 문자열필터 등의 기능은 필요한 VC에서 하도록 리팩토링하였다.
- 고민점 (2)
  - "var dateOfBirth: Date?의 변수명이 birthDate와 의미전달 차이가 있을까요?"
- 원인 및 
#### InApp📱
![InAppTest](https://user-images.githubusercontent.com/72292617/116174159-d8b29c00-a748-11eb-94bf-bd4b9fed7dd7.gif)

