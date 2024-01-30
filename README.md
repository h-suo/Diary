# 일기장 📔 (SwiftUI & MVVM)

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
> - **SwiftUI**
>   - `SwiftUI`를 이용하여 선언형 UI 구현
> - **MVVM**
>   - 프로젝트의 가독성 및 역할 분리를 위해 `MVVM` 패턴 사용
> - **Networking**
>   - 날씨 정보를 가져오기 위해 `URLSession`을 이용한 네트워킹
> - **CoreData**
>   - 데이터를 로컬에 저장하기 위해 `CoreData`를 이용한 저장 기능 구현
> - **LocationManager**
>   - 위치 정보를 가져오기 위해 `CLLocationManager`를 이용한 위치 정보 업데이트
> - **Combine**
>   - `Combine`을 이용하여 비동기 작업 처리

<br>

<a id="2."></a>

## 2. 👤 팀원

| [Erick](https://github.com/h-suo) |
| :--------: | 
| <Img src = "https://user-images.githubusercontent.com/109963294/235300758-fe15d3c5-e312-41dd-a9dd-d61e0ab354cf.png" width="350"/>|

<br>

<a id="3."></a>
## 3. ⏱️ 타임라인

> SwiftUI 리펙토링 기간 : 2024.01.15 ~ 2024.01.30

|날짜|내용|
|:---:|---|
| **2024.01.15** |▫️ Diary 엔티티 생성 <br> ▫️  DiaryListView, DiaryEditView, DiaryRowView 생성 <br>|
| **2024.01.16** |▫️ View Component 분리 <br>|
| **2024.01.18** |▫️ DiaryDTO 생성 <br> ▫️ CoreData Model 및 PersistenceController 생성 <br> ▫️ DiaryRepository 생성 <br>|
| **2024.01.19** |▫️ DiaryListViewModel 생성 <br>|
| **2024.01.22** |▫️ DIContainer 생성 <br> ▫️ DiaryDetailViewModel 생성 <br>|
| **2024.01.22** |▫️ DIContainer 생성 <br> ▫️ DiaryDetailViewModel 생성 <br>|
| **2024.01.23** |▫️ ViewModel Input, Output 로직 수정 <br>|
| **2024.01.25** |▫️ SwiftErickNetwork 패키지 추가 <br>|
| **2024.01.26** |▫️ EndPoint 생성 <br> ▫️ WeatherService 생성 <br> ▫️ LocationService 생성 <br>|
| **2024.01.27** |▫️ WeatherService에 icon fetch를 위한 로직 추가 <br>|
| **2024.01.29** |▫️ DiaryRepository, WeatherService 테스트 코드 추가 <br>|

<br>

<a id="4."></a>
## 4. 📊 UML & 파일트리

### UML

<Img src = "https://github.com/h-suo/Diary/assets/109963294/4bae260d-845d-45c7-bf97-8262947e2768" width="800"/>

<br>

### 파일트리

```
Diary
├── Application
│   ├── DiaryApp.swift
│   └── DIContainer.swift
├── Domain
│   ├── Entity
│   │   └── Diary.swift
│   ├── Repository
│   │   ├── DiaryRepository.swift
│   │   ├── LocationService.swift
│   │   └── WeatherService.swift
│   └── UseCase
│       └── DiaryUseCase.swift
├── Presentation
│   └── DiaryList
│   │   ├── ViewModel
│   │   │   └── DiaryListViewModel.swift
│   │   └── View
│   │       ├── DiaryListView.swift
│   │       └── DiaryRowView.swift
│   └── DiaryDetail
│       ├── ViewModel
│       │   └── DiaryDetailViewModel.swift
│       └── View
│           └── DiaryDetailView.swift
├── Data
│   ├── DTO
│   │   ├── DiaryDTO.swift
│   │   └── WeatherResponse.swift
│   ├── Repository
│   │   ├── DiaryCoreDataRepository.swift
│   │   ├── LocationManagerService.swift
│   │   └── WeatherNetworkService.swift
│   ├── CoreData
│   │   ├── Diary.xcdatamodeld
│   │   │   └── Diary.xcdatamodel
│   │   │       └── contents
│   │   └── PersistenceController.swift
│   └── Network
│       ├── CurrentWeatherEndPoint.swift
│       └── WeatherIconEndPoint.swift
├── Error
│   ├── DiaryRepositoryError.swift
│   └── LocationServiceError.swift
├── Util
│   ├── Extension
│   └── NameSpace.swift
└── Resource
    ├── Info.plist
    ├── API_KEY.xcconfig
    └── Assets.xcassets
```

<br>

<a id="5."></a>
## 5. 📱 실행 화면
| 일기 생성 | 일기 수정하기 |
| :--------------: | :-------: |
| <Img src = "https://github.com/h-suo/Diary/assets/109963294/2bc43ea6-3b14-4117-96a2-fe4d0abe46ff" width="300"/> | <Img src = "https://github.com/h-suo/Diary/assets/109963294/b7922bcb-572c-4175-acf4-c28b935b1f11" width="300"/>|
| **스와이프를 이용한 공유** | **스와이프를 이용한 삭제** |
| <Img src = "https://github.com/h-suo/Diary/assets/109963294/df6f9e35-1974-4576-b9e2-44cf9aea82a9" width="300"/> | <Img src = "https://github.com/h-suo/Diary/assets/109963294/2cc78542-c22a-413d-b252-884294a0be61" width="300"/> |
| **더보기 버튼을 이용한 공유** | **더보기 버튼을 이용한 삭제** |
| <Img src = "https://github.com/h-suo/Diary/assets/109963294/189abbf5-afbc-4bd2-be18-7e1c9c06d65e" width="300"/> | <Img src = "https://github.com/h-suo/Diary/assets/109963294/14793ff0-c5bd-46c2-949c-056803dede1c" width="300"/> |

<br>

<a id="6."></a>
## 6. 🤔 고민한 부분

### 1️⃣ PersistenceController

SwiftUI 내에서 CoreData를 사용하기 위해 PersistenceController를 이용하여 NSPersistentContainer를 생성했습니다.

<br>

**PersistenceController**

NSPersistentContainer를 SceneDelegate에 생성하여 전역적으로 사용하는 것이 아닌, PersistenceController를 이용해 NSPersistentContainer를 생성하여 preview에서 사용할 객체와 실제 프로젝트에서 사용할 기본적인 객체를 static 프로퍼티로 선언하여 접근할 수 있도록 했습니다.

또한 init에서 Store Type을 inMemory로 사용할지의 여부를 Bool 타입으로 받아 인스턴스를 생성하기 때문에 테스트 시에도 inMemory Type의 NSPersistentContainer 쉽게 생성할 수 있다는 장점이 있습니다.

```swift
struct PersistenceController {
  
  static let shared = PersistenceController()
  
  static var preview: PersistenceController = {
    let result = PersistenceController(inMemory: true)
    // ...
  }()
  
  let container: NSPersistentContainer
  
  init(inMemory: Bool = false) {
    // ...
  }
}
```

<br>

### 2️⃣ Networking with Combine

Combine을 이용하여 네트워킹을 하면 선언적 처리가 가능하며, stream을 이용한 반응형 UI 처리가 용이하기 때문에, 네트워킹의 비동기 작업을 Combine을 이용하여 처리했습니다.

<br>

**WeatherNetworkService**

[SwiftErickNetwork](https://github.com/h-suo/SwiftErickNetwork) 패키지에서 제공하는 NetworkManager의 requestPublisher를 이용하여 네트워킹 비동기 처리를 했습니다.

네트워킹을 통해 받아온 DTO 타입에서 필요한 데이터를 매핑하여 Weather 객체를 반환하도록 했습니다.

```swift
struct WeatherNetworkService: WeatherService {
  
  private let networkManager: NetworkManageable
  
  init(networkManager: NetworkManageable = NetworkManager()) {
    self.networkManager = networkManager
  }
  
  func fetchWeatherPublisher(
    location: CLLocationCoordinate2D
  ) -> AnyPublisher<Weather, NetworkError> {
    guard let endPoint = CurrentWeatherEndPoint(lat: String(location.latitude),
                                                lon: String(location.latitude))
    else { return Fail(error: NetworkError.invalidComponents).eraseToAnyPublisher() }
    
    return networkManager
      .requestPublisher(with: endPoint)
      .tryMap { weatherResponse in
        guard let weather = weatherResponse.weather.first
        else { throw NetworkError.emptyData }
        
        return weather
      }
      .mapError { error in
        if let networkError = error as? NetworkError {
          return networkError
        } else {
          return NetworkError.dataTask(error)
        }
      }
      .eraseToAnyPublisher()
  }
    
  // ...
}
```

<br>

**LoactionPublisher + WeatherPublisher**

위치 정보를 받아오는 requestLoactionPublisher() 함수도 Publisher를 반환하기 때문에 완료 처리를 두 번 해주는 것이 아닌 Operator를 이용해 Publisher를 매핑하여 하나의 Stream으로 비동기 처리를 했습니다..

mapError로 에러를 매핑하고 flatMap으로 게시된 location data를 이용해 fetchWeatherPublisher(location: location)를 호출하여 새로운 OutPut으로 Publisher를 매핑하여 비동기 처리를 했습니다.

```swift
useCase.requestLoactionPublisher()
  .mapError { _ in NetworkError.invalidComponents }
  .flatMap { location in
    self.useCase.fetchWeatherPublisher(location: location)
  }
  .receive(on: DispatchQueue.main)
  .sink { completion in
    if case .failure(let error) = completion {
      print(error.localizedDescription)
      self.errorMessage = NameSpace.weatherFetchFailed
      self.isError = true
    }
  } receiveValue: { weather in
    self.diary.weatherID = weather.icon
    self.updateDiary()
  }
  .store(in: &cancelables)
```

<br>

### 3️⃣ CLLocation in SwiftUI

기존 Diary에서는 ViewController에서 CLLocationManager를 가지고 있고 CLLocationManagerDelegate를 채택하여 Location 데이터를 받아와 처리했습니다.

하지만 SwiftUI의 View는 구조체이기 때문에 CLLocationManagerDelegate를 채택할 수 없고, MVVM으로 프로젝트를 설계하며 Location 데이터를 받아오는 객체를 따로 빼주기 위해 LocationManagerService를 만들었습니다.

<br>

**LocationService**

우선 위치를 가져오는 기능을 가진 LocationService를 정의했습니다. 비동기 작업에 대한 처리는 AnyPublisher<CLLocationCoordinate2D, LocationServiceError>를 반환하여 위치를 받는 객체에서 Publisher를 구독해서 처리하도록 하였습니다.

```swift
protocol LocationService {
  func requestLoactionPublisher() -> AnyPublisher<CLLocationCoordinate2D, LocationServiceError>
}
```

<br>

**LocationManagerService**

LocationService를 채택한 실제 객체인 LocationManagerService는 CLLocationManagerDelegate를 채택하여 위치 정보를 요청하는 작업과 위치 정보를 받아 반환하는 역할을 모두 하도록 했습니다.

```swift
final class LocationManagerService: NSObject, CLLocationManagerDelegate, LocationService {
  
  private var locationManager: CLLocationManager
  private var locationSubject = PassthroughSubject<CLLocationCoordinate2D, LocationServiceError>()
  
  init(locationManager: CLLocationManager = CLLocationManager()) {
    self.locationManager = locationManager
    super.init()
    
    self.locationManager.delegate = self
    self.locationManager.requestWhenInUseAuthorization()
  }
  
  func requestLoactionPublisher() -> AnyPublisher<CLLocationCoordinate2D, LocationServiceError> {
    locationManager.requestLocation()
    return locationSubject.eraseToAnyPublisher()
  }
  
  func locationManager(
    _ manager: CLLocationManager,
    didUpdateLocations locations: [CLLocation]
  ) {
    guard let location = locations.last?.coordinate
    else { return }
    
    locationSubject.send(location)
    locationManager.stopUpdatingLocation()
  }
  
  func locationManager(
    _ manager: CLLocationManager,
    didFailWithError error: Error
  ) {
    locationSubject.send(completion: .failure(LocationServiceError.requestLocation(error)))
  }
}
```

<br>

**Handling**

requestLoactionPublisher()로 위치 정보를 요청하면 PassthroughSubject를 AnyPublisher 타입으로 Type Eraser Wrapped 하여 반환합니다. 또한 locationManager는 위치 정보를 요청합니다.

그리고 위치 정보나 에러가 업데이트되면 Subject.send를 이용해 AnyPublisher에 데이터를 게시하여 구독자가 이를 받아 처리할 수 있도록 했습니다.

```swift
LocationManagerService()
  .requestLoactionPublisher()
  .sink { completion in
    if case .failure(let error) = completion {
      // Error handling
    }
  } receiveValue: { location in
    // Location data handling 
  }
  .store(in: &cancelables)
```

<br>

<a id="7."></a>
## 7. 🔗 참고 링크
- [Apple Developer: Combine](https://developer.apple.com/documentation/combine)
- [Apple Developer: dataTaskPublisher(for:)](https://developer.apple.com/documentation/foundation/urlsession/3329708-datataskpublisher)
- [Apple Developer: eraseToAnyPublisher()](https://developer.apple.com/documentation/combine/just/erasetoanypublisher())
- [Apple Developer: CLLocationManager](https://developer.apple.com/documentation/corelocation/cllocationmanager)
- [Apple Developer: CLLocationManagerDelegate](https://developer.apple.com/documentation/corelocation/cllocationmanagerdelegate)

<br>

---

[⬆️ 처음으로 돌아가기](#.)
