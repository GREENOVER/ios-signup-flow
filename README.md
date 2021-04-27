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
- 문제점 (1)
  - 사용자가 타이핑을 하다 다른 영역을 스치기만해도 키보드가 내려가버리는 문제
- 원인
  - 사용자의 터치에 대한 키보드 내려가는 기능을 touchesBegan 메서드로 구현하였는데, 터치가 발생했다고 시스템에서 느끼는 순간 동작됨으로 잘못된 터치 등을 고려하지 못하여 즉각 반응하게 되어 문제가 발생
  ```swift
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
   self.view.endEditing(true)
  }
  ```
- 해결방안
  - touchesBegan VS TapGestureRecognizer를 비교해봤을때 탭제스쳐는 해당 터치가 정상적인 터치/탭인지 판별하고 동작을 수행한다. 즉 꾹 누르고있으면 터치로 간주 안하게 할 수도 있는것이다. 사용자의 편의성과 확장성을 더 보장하는 방식이라고 느껴져 아래와 같이 TapGestureRecognizer로 수정하였다.
  ```swift
  let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView(gestureRecognizer:)))
        self.view.addGestureRecognizer(tapRecognizer)
    }
        
    @objc func tapView(gestureRecognizer: UIGestureRecognizer) {
        self.view.endEditing(true)
    }
  ```
- 문제점 (2)
  - 이미지를 외부에서 넣어주었는데 다른 동료가 프로젝트를 열었을때는 시뮬레이터에 나타나지 않고 에러 메시지가 뜨는 문제
- 원인
  - 이미지를 로컬에서 Xcode로 가져와서 이미지를 처리하고 관리하는 부분이 익숙치 않아 발생한 문제로 내 로컬에서도 이미지의 위치를 옮긴다면 동료가 겪은 현상이 나타날것이다. 즉 이미지가 위치한 로컬 경로를 복사한 방식이였다.
- 해결방안
  - 이미지 파일을 Asset Catalog를 통해 관리하도록 변경하였다. 에셋 카탈로그를 통해 관리함으로 이미지의 데이터들을 저장해주고 디바이스마다 크기/비율에 대한 관리를 추후 편리하게 해줄 수 있다.
- 





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
- 원인 및 대책
  - 메서드는 동사형태로 변수명은 명사형태로 네이밍을 하다보니 습관적으로 dateOfBirth로 네이밍을 하였는데, birthDate 자체가 생일이라는 뜻이여서 변수 네이밍을 수정하였다. 네이밍에 대해 고민이 많았던 포인트로 가독성이 좋고 명확한 네이밍으로 리팩토링을 하게 되었다.
- 고민점 (3)
  - "image를 String 타입으로 표현할 수 있을까요?"
  ```swift
  var password: String?
  var phoneNumber: String?
  var dateOfBirth: Date?
  var profileImage: String?
  ```
- 원인 및 대책
  - image를 String 타입으로 구현하면 UIKit을 import하지 않고 선언할 수 있을것 같아 초기 String 타입으로 정의하였는데, 이미지의 크기나 위치 변경 시 UIImage 타입으로 정의해주는것이 적합하여 UIImage 타입으로 수정하였다.
  ```swift
  import Foundation
  import UIKit

  class UserInformation {
    static let shared = UserInformation()
    
    private init() {
    }
   
    var id: String?
    var password: String?
    var phoneNumber: String?
    var birthDate: Date?
    var profileImage: UIImage?
    var introduction: String?
   }
  ```
- 고민점 (4)
  - "디폴트로 만들어주는 ViewController 말고 의미있는 이름을 지어주는 건 어떨까요?"
- 원인 및 대책
  - 이전 프로젝트에서는 메인 ViewController의 파일명이나 네이밍을 전부 ViewController라고 해주었는데 VC가 많아지면 모호한 표현이 되는것같다. 이에 VC가 메인 하나만 있더라도 최대한 해당 VC의 역할을 담은 네이밍으로 수정하게 되었다.
- 고민점 (5)






#### InApp📱
![InAppTest](https://user-images.githubusercontent.com/72292617/116174159-d8b29c00-a748-11eb-94bf-bd4b9fed7dd7.gif)

