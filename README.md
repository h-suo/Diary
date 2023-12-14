# 일기장 📔

## 📖 목차

0. [🛠️ 프로젝트 설정](#0.)
1. [📢 소개](#1.)
2. [👤 팀원](#2.)
3. [⏱️ 타임라인](#3.)
4. [📊 UML & 파일트리](#4.)
5. [📱 실행 화면](#5.)
6. [🤔 고민한 부분](#6.)
7. [🔗 참고 링크](#7.)

<br>

<a id="0."></a>

## 0. 🛠️ 프로젝트 설정

<details>
<summary>프로젝트 설정 방법 보기</summary>
 
| 🔑 API KEY | 프로젝트를 실행하기 전 API 키를 세팅해야 합니다. |
|:---:|---|
| <Img src = "https://github.com/h-suo/Diary/assets/109963294/d060db3c-c6a1-4b6c-977b-92cefbd5e589" width="350"/> | 프로젝트 내 `Resource` 그룹 내에 `API_KEY.xcconfig` 파일을 생성합니다. |
| <Img src = "https://github.com/h-suo/Diary/assets/109963294/3e8da6da-7afd-4ce4-bda9-45ec3e6e5760" width="500"/> | 생성한 파일 내에 `OPENWEATHER_API_KEY = KEY`를 입력 후 `KEY` 부분에 [OpenWeather](https://openweathermap.org/current)의 API 키를 넣으면 네트워킹을 할 수 있습니다. |

</details>

<br>

<a id="1."></a>

## 1. 📢 소개
일기를 작성하고 간직하세요!
작성하신 일기는 목록으로 볼 수 있습니다!

> **핵심 개념 및 경험**
> 
> - **MVC**
>   - 프로젝트의 가독성을 높이기 위해 `MVC` 패턴을 이용한 프로젝트 파일 분리
> - **Networking**
>   - 일기를 쓰는 날에 날씨 정보를 가져오기 위해 `URLSession`을 이용한 네트워킹
> - **CoreData**
>   - 일기의 데이터를 로컬에 저장하기 위해 `CoreData`를 이용한 저장 기능 구현
> - **Localizing**
>   - 여러 국가의 사용자 접근성을 높이기 위해 다국어 처리 및 날짜 포맷 사용자화
> - **UnitTest**
>   - `Model` 객체가 의도에 맞게 동작하는지 확인하기 위해 `Unit Test` 구현
>   <br>
> - **UITableViewDiffableDataSource**
>   - 애니메이션화된 데이터 변경과 데이터 변경에 따른 UI 업데이트를 위해 `DiffableDataSource` 사용
> - **keyboardWillShowNotification**
>   - 키보드가 나타났을 때 동작 설정을 위해 `keyboardWillShowNotification` 사용
> - **UISwipeActionsConfiguration**
>   - 셀의 스와이프 동작 설정을 위해 `SwipeActions` 사용
> - **UIActivityViewController**
>   - 일기 내용 공유를 위해 `ActivityViewController` 사용

<br>

<a id="2."></a>

## 2. 👤 팀원

| [Erick](https://github.com/h-suo) |
| :--------: | 
| <Img src = "https://user-images.githubusercontent.com/109963294/235300758-fe15d3c5-e312-41dd-a9dd-d61e0ab354cf.png" width="350"/>|

<br>

<a id="3."></a>
## 3. ⏱️ 타임라인

> 프로젝트 기간 : 2023.08.28 ~ 2023.09.15

|날짜|내용|
|:---:|---|
| **2023.08.28** |▫️ `sample` 데이터를 디코딩 할 DTO 생성 <br> ▫️ 일기 목록을 보여주는 `DiaryListViewController` UI 세팅 <br>|
| **2023.08.29** |▫️ 일기를 반환 및 저장하는 `DiaryStorageProtocol` 생성 <br> ▫️ 날짜를 포맷하는 `DateFormatManager` 구현 <br> ▫️ `TableViewCell` 생성 <br>|
| **2023.08.30** |▫️ 일기를 보여주는 `DiaryViewController` 생성 <br> ▫️ 키보드가 나타났을 때`TextView`도 따라 올라가는 로직 구현 <br>|
| **2023.08.31** |▫️ 데이터 로딩에 실패했을 때 `Alert`이 뜨도록 구현 <br>|
| **2023.09.04** |▫️ `CoreData`의 `Entity` 추가 및 `subclass` 생성 <br> ▫️ `Diary`를 `CoreData`를 이용해 저장하는 `CoreDataDiaryStorage` 생성 <br>|
| **2023.09.08** |▫️ `CoreDataDiaryStorage`의 `CRUD` 메서드 구현 <br>|
| **2023.09.09** |▫️ `SwipeActions`을 이용한 삭제 기능 구현 <br>|
| **2023.09.10** |▫️ `ActivityViewController`를 이용한 공유 기능 구현 <br> ▫️ 백그라운드 전환 시 저장 기능 구현 <br>|

<br>

> 리펙토링 기간 : 2023.11.06 ~ 2023.11.18

|날짜|내용|
|:---:|---|
| **2023.11.06** |▫️ 그룹 분리 및 `Network Layer` 추가 <br> ▫️ `EndPoint` 및 `NetworkManager` 생성 <br>|
| **2023.11.07** |▫️ `WeatherResponse` DTO 생성 <br>|
| **2023.11.09** |▫️ `CoreData` 마이그레이션 <br>|
| **2023.11.10** |▫️ 네트워킹을 통해 날씨 아이콘을 받아오는 기능 구현 <br>|
| **2023.11.16** |▫️ `EndPoint` 테스트 추가 <br>|
| **2023.11.16** |▫️ 네트워킹 테스트를 위한 `test Double`생성 <br> ▫️ `NetworkManager` 테스트 추가 <br>|

<br>

<a id="4."></a>
## 4. 📊 UML & 파일트리

### UML

<Img src = "https://github.com/h-suo/Diary/assets/109963294/82dfa404-25b6-4274-9b04-9912db088ea2" width="800"/>

<br>

### 파일트리
```
Diary
├── Application
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
├── Network
│   ├── Protocol
│   │   ├── NetworkConfigurable.swift
│   │   ├── NetworkManageable.swift
│   │   └── URLSessionProtocol.swift
│   ├── DTO
│   │   ├── Diary.swift
│   │   └── WeatherResponse.swift
│   ├── EndPoint
│   │   ├── CurrentWeatherEndPoint.swift
│   │   └── WeatherIconEndPoint.swift
│   └── NetworkManager.swift
├── Model
│   ├── Protocol
│   │   ├── DiaryManageable.swift
│   │   ├── DiaryReadable.swift
│   │   └── LocaleDateFormatterProtocol.swift
│   ├── Entity
│   │   ├── DiaryEntity+CoreDataClass.swift
│   │   ├── DiaryEntity+CoreDataProperties.swift
│   │   └── DiaryEntry.swift
│   ├── Reader
│   │   ├── AssetDiaryReader.swift
│   │   └── CoreDataDiaryManager.swift
│   └── LocaleDateFormatter
│       └── UserDateFormatter.swift
├── Controller
│   └── Protocol
│   │   ├── AppResignObservable.swift
│   │   └── DiaryEditViewControllerDelegate.swift
│   ├── DiaryEditViewController.swift
│   └── DiaryListViewController.swift
├── View
│   └── DiaryTableViewCell.swift
├── Error
│   ├── ConversionError.swift
│   ├── NetworkError.swift
│   └── StorageError.swift
├── Util
│   ├── Extension
│   │   ├── Notification.name+.swift
│   │   ├── UITextView+.swift
│   │   └── URLSession+.swift
│   ├── Manager
│   │   ├── ActivityViewManager.swift
│   │   ├── AlertManager.swift
│   │   └── DateFormatManager.swift
│   └── NameSpace.swift
├── Data
│   ├── DiaryData.xcdatamodeld
└── Resource
    ├── API_KEY.xcconfig
    ├── Assets.xcassets
    ├── Info.plist
    └── Localizable.strings
```

<br>

<a id="5."></a>
## 5. 📱 실행 화면
| 일기 생성 | 일기 수정하기 |
| :--------------: | :-------: |
| <Img src = "https://github.com/h-suo/Diary/assets/109963294/dfc1debf-e373-406c-b745-5263a0da5f34" width="300"/> | <Img src = "https://github.com/h-suo/Diary/assets/109963294/13dca1ec-a10f-4f84-9abe-e7b17247b5d1" width="300"/>|
| **스와이프를 이용한 공유** | **스와이프를 이용한 삭제** |
| <Img src = "https://github.com/h-suo/Diary/assets/109963294/44df1381-9bcf-49cc-95e9-095854442be1" width="300"/> | <Img src = "https://github.com/h-suo/Diary/assets/109963294/8c1b301a-3204-489c-b0da-ce0f07cfe4ff" width="300"/> |
| **더보기 버튼을 이용한 공유** | **더보기 버튼을 이용한 삭제** |
| <Img src = "https://github.com/h-suo/Diary/assets/109963294/45e10038-e5ab-4837-902b-0e0fbc0fa180" width="300"/> | <Img src = "https://github.com/h-suo/Diary/assets/109963294/ef2cbed3-cdbb-47e1-aa09-7fb5d82679a4" width="300"/> |
| **사용자 언어 변경** | **텍스트 크기 키우기** |
| <Img src = "https://github.com/h-suo/Diary/assets/109963294/12c17465-568a-428f-9a00-8f8038530a19" width="300"/> | <Img src = "https://github.com/h-suo/Diary/assets/109963294/1ccfc5d7-8b02-4bd4-84a4-4f5872a3c931" width="300"/> |

<br>

<a id="6."></a>
## 6. 🤔 고민한 부분

### 1️⃣ 파일 분리

프로젝트의 가독성을 높이기 위해 파일 분리와 그룹화에 대해 고민을 했습니다.
`MVC` 패턴을 사용하여 `Model`, `View`, `Controller`를 나누는 것을 시작으로 그 외에 객체와 파일을 역할 별로 나누어 그룹화했습니다.

> **Application**
> : 앱의 생명주기를 관리하는 `AppDelegate`, `SceneDelegate`
> 
> **Network**
> : 네트워킹을 하는데 필요한 객체
> 
> **Model**
> : 데이터 모델이나 데이터를 처리하는 모델 객체
> 
> **Controller**
> : 사용자 이벤트를 처리하고 뷰를 업데이트하는 컨트롤러 객체
> 
> **View**
> : UI를 구현하는 뷰 객체
> 
> **Error**
> : 프로젝트에 필요한 에러
> 
> **Util**
> : 프로젝트에 필요한 기능을 제공하는 `Util` 객체와 `Extension` 코드
> 
> **Data**
> : `CoreData`의 데이터 모델 파일
> 
> **Resource**
> : 이미지, `Localizable` 문자열, `Sample` 파일 등 프로젝트에 필요한 자원
> 

<br>

### 2️⃣ Protocol의 활용

역할의 추상화를 하고 객체 간 소통을 할 때 실제 객체가 아닌 추상화된 객체와 소통할 수 있게 하기 위해 `Protocol`을 활용했습니다.
프로젝트에서 `Protocol`을 활용한 예시를 설명해 보겠습니다.

일기를 읽는 역할을 추상화한 `DiaryReadable`을 만들어 일기를 읽는 역할을 하는 객체는 `DiaryReadable`을 채택하고 사용하는 객체는 실제 객체가 아닌 추상화된 객체를 사용하도록 설계했습니다.

**DiaryReadable**

```swift
protocol DiaryReadable {
  
  func diaryEntrys() throws -> [DiaryEntry]
}
```

**Reader**

```swift
final class AssetDiaryReader: DiaryReadable {
  
  func diaryEntrys() throws -> [DiaryEntry] {
    // ...
  }
}
```

```swift
final class CoreDataDiaryManager {
  
  // ...
}

extension CoreDataDiaryManager: DiaryReadable {
  
  func diaryEntrys() throws -> [DiaryEntry] {
    // ...
  }
}
```

**DiaryListViewController**

```swift
final class DiaryListViewController: UIViewController {
  
  private let diaryReader: DiaryReadable
  // ...
  
  init(
    diaryReader: DiaryReadable,
    // ...
  ) {
    self.diaryReader = diaryReader
    // ...
  }
    
  // ...
}
```

<br>

### 3️⃣ Network Layer

네트워킹을 하는데 필요한 객체를 `DTO`, `EndPoint`, `NetworkManager`로 나누어 추후 새로운 `API`로 통신이 필요할 경우 확장에 용이하도록 구현했습니다.

**NetworkConfigurable**

아래 코드는 `EndPoint`를 추상화한 `NetworkConfigurable` `Protocol`입니다.

`Response` 타입과 `URL`을 구성하는 `Components`를 속성으로 가지고 있고 `Extension`으로 `urlRequest()`와 `url()` 메서드를 기본 구현하여 `EndPoint` 객체가 `NetworkConfigurable`을 채택하는 것만으로 메서드를 사용할 수 있도록 했습니다.

```swift
protocol NetworkConfigurable {
  
  associatedtype Response
  
  var baseURL: String { get }
  var path: String { get }
  var method: HttpMethod { get }
  var queryParameters: [URLQueryItem]? { get }
}

extension NetworkConfigurable {
    
  func urlRequest() throws -> URLRequest {
    // ...
  }
  
  func url() throws -> URL {
    // ...
  }
}
```

**NetworkManageable**

`NetworkManager`의 역할인 네트워킹을 추상화한 `NetworkManageable` `Protocol`입니다.

추상화된 프로토콜인 `NetworkConfigurable`을 파라미터로 받아 `NetworkConfigurable`의 `Response` 타입을 결과로 반환하도록 구현했습니다.

실제 객체가 아닌 추상화에 의존하여 새로운 `EndPoint`가 `NetworkConfigurable`을 채택하고 있다면 네트워킹이 가능하기 때문에 확장에 용이합니다.

```swift
protocol NetworkManageable {
  
  var urlSession: URLSessionProtocol { get }
  
  func request<DTO: Decodable, EndPoint: NetworkConfigurable>(
    with endpoint: EndPoint,
    completion: @escaping (Result<DTO, NetworkError>) -> Void
  ) where EndPoint.Response == DTO
  
  func request(
    with url: URL,
    completion: @escaping (Result<Data, NetworkError>) -> Void
  )
}
```

<br>

### 4️⃣ Localizing

언어와 날짜 표시를 사용자 설정에 맞게 현지화하여 보이도록 했습니다.

**UserDateFormatter**

`DateFormatter`의 `locale`과 `timeZone`을 `current`로 설정하여 사용자의 로케일 및 시간대 설정을 기반으로 날짜를 표시하도록 구현했습니다.

```swift
final class UserDateFormatter: LocaleDateFormatterProtocol {
  
  // ...
  var dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale.current
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.dateStyle = .long
    
    return dateFormatter
  }()
}
```

**Localizable**

사용자가 보는 텍스트를 `Localizable.strings` 파일을 생성하여 다국어 처리하여, 언어를 바꿨을 때 해당 언어에 맞게 텍스트가 바뀌도록 구현했습니다.

```strings
/* English */

"Diary" = "Diary";
// ...
```

```strings
/* Korean */

"Diary" = "일기장";
// ...
```

<br>

### 5️⃣ Unit Test

객체가 의도에 맞게 잘 동작하는지 알아보기 위해 `Unit Test`를 작성했습니다.
테스트가 어떤 상황에서도 잘 동작하도록 작성했습니다.

**CoreData Test**

데이터를 로컬에 저장하지 않고 테스트하기 위해 `PersistentContainer`의 `store type`을 `InMemory`로 설정하여 테스트 이후 데이터가 지워지도록 했습니다.

```swift
final class CoreDataDiaryManagerTests: XCTestCase {
  
  // MARK: - Setup Test
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "DiaryData")
    let storeDescription = NSPersistentStoreDescription()
    storeDescription.type = NSInMemoryStoreType
    container.persistentStoreDescriptions = [storeDescription]
    // ...
  }()
  
  var sut: CoreDataDiaryManager!
  
  override func setUpWithError() throws {
    sut = CoreDataDiaryManager(persistentContainer: persistentContainer)
  }
  
  override func tearDownWithError() throws {
    sut = nil
  }
    
  // ...
}
```

**Test Double**

네트워크가 연결되어 있지 않은 상황에서도 `NetworkManager`를 테스트하기 위해 `Test Double` 객체를 만들어 테스트했습니다.

`Dummy Response`와 `MockURLSession`을 만들어 테스트하고 싶은 응답을 넘겨주도록 설계하여 테스트를 진행했습니다.

```swift
protocol Response {
  var data: Data? { get }
  var response: URLResponse? { get }
  var error: Error? { get }
}
```

```swift
final class MockURLSession: URLSessionProtocol {
  var response: Response?
  
  init(response: Response?) {
    self.response = response
  }
  
  func dataTask(
    with request: URLRequest,
    completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void
  ) -> URLSessionDataTask {
    return MockURLSessionDataTask {
      let response = self.response
      completionHandler(response?.data, response?.response, response?.error)
    }
  }
    
  // ...
}
```


<br>

<a id="7."></a>
## 7. 🔗 참고 링크
- [🍎Apple: locale](https://developer.apple.com/documentation/foundation/dateformatter/1411973-locale)
- [🍎Apple: setLocalizedDateFormatFromTemplate](https://developer.apple.com/documentation/foundation/dateformatter/1417087-setlocalizeddateformatfromtempla)
- [🍎Apple: timezone](https://developer.apple.com/documentation/foundation/dateformatter/1411406-timezone)
- [🍎Apple: keyboardWillShowNotification](https://developer.apple.com/documentation/uikit/uiresponder/1621576-keyboardwillshownotification)
- [🍎Apple: keyboardFrameEndUserInfoKey](https://developer.apple.com/documentation/uikit/uiresponder/1621578-keyboardframeenduserinfokey)
- [🍎Apple: UIActivityViewController](https://developer.apple.com/documentation/uikit/uiactivityviewcontroller)
- [🍎Apple: NSManagedObject](https://developer.apple.com/documentation/coredata/nsmanagedobject)
- [🍎Apple: NSManagedObjectContext](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext)
