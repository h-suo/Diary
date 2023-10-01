# 일기장 📔

## 📖 목차

1. [📢 소개](#1.)
2. [👤 팀원](#2.)
3. [⏱️ 타임라인](#3.)
4. [📊 UML & 파일트리](#4.)
5. [📱 실행 화면](#5.)
6. [🧨 트러블 슈팅](#6.)
7. [🔗 참고 링크](#7.)

<br>

<a id="1."></a>

## 1. 📢 소개
일기를 작성하고 간직하세요!
작성하신 일기는 목록으로 볼 수 있습니다!

> **핵심 개념 및 경험**
> 
> - **DateFormatter**
>   - `locale` 프로퍼티를 이용한 지역화
> - **UITableViewDiffableDataSource**
>   - `DiffableDataSource`를 이용한 애니메이션화된 데이터 바인딩
> - **UITextView**
>   - `UITextView`를 이용한 텍스트 편집과 보기
> - **keyboardWillShowNotification**
>   - `keyboardWillShow` 노티를 이용한 키보드가 나타났을 때 동작 설정
> - **CoreData**
>   - `CoreData`를 이용한 일기 데이터의 저장
> - **UISwipeActionsConfiguration**
>   - `SwipeActions`를 이용한 셀의 스와이프 동작
> - **UIActivityViewController**
>   - `ActivityViewController`를 이용한 일기 내용 공유

<br>

<a id="2."></a>

## 2. 👤 팀원

| [Erick](https://github.com/h-suo) |
| :--------: | 
| <Img src = "https://user-images.githubusercontent.com/109963294/235300758-fe15d3c5-e312-41dd-a9dd-d61e0ab354cf.png" width="350"/>|

<br>

<a id="3."></a>
## 3. ⏱️ 타임라인

> 프로젝트 기간 :  2023.08.28 ~ 2023.09.15

|날짜|내용|
|:---:|---|
| **2023.08.28** |▫️ `sample` 데이터를 디코딩할 DTO 생성 <br> ▫️ 일기 목록을 보여주는 `DiaryListViewController` UI 세팅 <br>|
| **2023.08.29** |▫️ 일기를 반환 및 저장하는 `DiaryStorageProtocol` 생성 <br> ▫️ 날짜를 포멧하는 `DateFormatManager` 구현 <br> ▫️ `TableViewCell` 생성 및 데이터 바인딩 <br>|
| **2023.08.30** |▫️ 일기를 보여주는 `DiaryViewController` 생성 <br> ▫️ 키보드가 나타났을 때`TextView`도 따라 올라가는 로직 구현 <br>|
| **2023.08.31** |▫️ 데이터 바인딩에 실패했을 때 `Alert`이 뜨도록 구현 <br> ▫️ README 작성 <br>|
| **2023.09.01** |▫️ 코드 개선을 위한 리펙토링 <br>|
| **2023.09.04** |▫️ `CoreData`의 `Entity` 추가 및 `subclass` 생성 <br> ▫️ `Diary`를 `CoreData`를 이용해 저장하는 `CoreDataDiaryStorage` 생성 <br>|
| **2023.09.08** |▫️ `CoreDataDiaryStorage`의 `CRUD` 메서드 구현 <br>|
| **2023.09.09** |▫️ `SwipeActions`을 이용한 삭제 기능 구현 <br>|
| **2023.09.10** |▫️ `ActivityViewController`를 이용한 공유 기능 구현 <br> ▫️ 백그라운드 전환시 저장 기능 구현 <br>|
| **2023.09.12** |▫️ 코드 개선을 위한 리펙토링 <br>|
| **2023.09.14** |▫️ 코드 개선을 위한 리펙토링 <br>|
| **2023.09.15** |▫️ README 작성 <br>|

<br>

<a id="4."></a>
## 4. 📊 UML & 파일트리

### UML

<Img src = "https://github.com/h-suo/ios-diary/assets/109963294/eaa81f9b-b0e7-4b6c-8c74-0f30c6dc2fdb" width="600"/>

<br>

### 파일트리
```
Diary
├── Application
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
├── Protocol
│   ├── AppResignObservable.swift
│   ├── DiaryManageable.swift
│   ├── DiaryReadable.swift
│   └── LocaleDateFormatterProtocol.swift
├── Model
│   ├── ActivityViewManager.swift
│   ├── AlertManager.swift
│   ├── DateFormatManager.swift
│   ├── DiaryEntry.swift
│   ├── DTO
│   │   └── Diary.swift
│   ├── LocaleDateFormatter
│   │   └── UserDateFormatter.swift
│   └── Reader
│       ├── AssetDiaryReader.swift
│       └── CoreDataDiaryManager.swift
├── Controller
│   ├── DiaryListViewController.swift
│   └── DiaryViewController.swift
├── View
│   └── DiaryTableViewCell.swift
├── Error
│   ├── ConversionError.swift
│   └── StorageError.swift
├── Data
│   └── DiaryData.xcdatamodeld
│       └── Diary.xcdatamodel
│           └── contents
├── Resource
│   ├── Assets.xcassets
│   ├── Base.lproj
│   │   └── LaunchScreen.storyboard
│   └── Info.plist
└── Util
    └── Extension
        ├── Notification.name+.swift
        ├── UIAlertController+.swift
        └── UITextView+.swift
```

<br>

<a id="5."></a>
## 5. 📱 실행 화면
| 목록화면에서 일기 화면으로 넘어가기 | 키보드가 올라왔을 때 |
| :--------------: | :-------: |
| <Img src = "https://github.com/h-suo/ios-diary/assets/109963294/42b8c4fc-adf5-4896-94a6-7b4eb6cf715f" width="300"/> | <Img src = "https://github.com/h-suo/ios-diary/assets/109963294/f4b7daf6-6d54-48b2-a752-c7e8754ba724" width="300"/>|
| **일기 생성** | **일기 수정하기** |
| <Img src = "https://github.com/h-suo/ios-diary/assets/109963294/59dea197-a7ad-4e51-9887-262e4882382e" width="300"/> | <Img src = "https://github.com/h-suo/ios-diary/assets/109963294/1e07b17f-6960-444c-af68-ffb439064675" width="300"/> |
| **스와이프를 이용한 공유** | **스와이프를 이용한 삭제** |
| <Img src = "https://github.com/h-suo/ios-diary/assets/109963294/4f6c1c3b-4078-4d19-8046-6676cfbafe4d" width="300"/> | <Img src = "https://github.com/h-suo/ios-diary/assets/109963294/e515170d-c69a-4b12-9532-f445fa61cc08" width="300"/> |
| **더보기 버튼 이용한 공유** | **더보기 버튼 이용한 삭제** |
| <Img src = "https://github.com/h-suo/ios-diary/assets/109963294/c4437835-9cb8-43df-84b4-1baa3a27a80c" width="300"/> | <Img src = "https://github.com/h-suo/ios-diary/assets/109963294/7850c98d-6286-4142-b2ae-bbfb1c3aa2db" width="300"/> |

<br>

<a id="6."></a>
## 6. 🧨 트러블 슈팅

### 1️⃣ 프로토콜의 활용

#### 🔥 문제점
일기 목록을 보여주는 `DiaryListViewController`가 일기를 가져오기 위한 객체를 가지고 있어야 했습니다.
초기에는 실제 객체를 가지고 있도록 했지만 추후 일기를 가져오는 객체가 변경될 때 `Controller`의 코드가 모두 수정되어야 한다는 문제가 있었습니다.

#### 🧯 해결방법
프로토콜을 활용하면 이를 해결할 수 있을 거라 생각하여 일기를 반환하고 저장하는 `DiaryStorageProtocol`을 만들어 `DiaryListViewController`가 해당 타입을 가지고 있도록 하여 추후 일기를 전달하는 객체가 변경되더라도 `Controller`의 코드가 수정되지 않도록 했습니다.

```swift
protocol DiaryStorageProtocol {
    func diaryEntrys() throws -> [DiaryEntry]
    func storeDiary(_ diary: DiaryEntry)
}
```

<br>

### 2️⃣ Date 지역화

#### 🔥 문제점
날짜를 표시할때 지역화를 해주지 않는다면 사용자가 언어와 지역을 바꾸더라도 해당 설정에 맞게 텍스트가 변하지 않는 문제가 있었습니다.

#### 🧯 해결방법
`DateFormatter`의 `locale` 프로퍼티와 `timeZone` 프로퍼티를 `current`로 설정하여 언어와 지역이 바뀌더라도 날짜 포멧이 자동으로 바뀔 수 있도록 했습니다.

```swift
let userLocale = Locale.current
let userTimeZone = TimeZone.current

let dateFormatter = DateFormatter()
dateFormatter.locale = Locale(identifier: userLocale.identifier)
dateFormatter.setLocalizedDateFormatFromTemplate("dd MMM yyyy")
dateFormatter.timeZone = TimeZone(identifier: userTimeZone.identifier)
```

<br>

### 3️⃣ keyboardWillShow

#### 🔥 문제점
키보드가 올라왔을 때 `TextView`가 가려지는 문제가 있었습니다.

<Img src = "https://github.com/h-suo/ios-diary/assets/109963294/33be182b-dfff-45c2-8607-a9167e100c87" width="300"/>

> 커서가 키보드 아래 있는 상태

#### 🧯 해결방법
`keyboardWillShowNotification`을 이용해서 키보드가 보일 때 키보드의 높이 만큼 `TextView`의 `Inset` `bottom`을 띄어 `TextView`가 가려지지 않도록 설정했습니다.

```swift
func addObserveKeyboardNotification() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
}

@objc private func keyboardWillShow(_ notification: Notification) {
    if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
        let keyboardHeight = keyboardFrame.height

        self.contentInset = UIEdgeInsets(top: .zero, left: .zero, bottom: keyboardHeight, right: .zero)
    }
}
```
- `keyboardWillShowNotification`를 관찰하여 신호가 발생했을 때 `keyboardWillShow(_:)`를 실행
- `keyboardFrameEndUserInfoKey`로 노티의 `userInfo`에서 `frame`을 가져와 그 높이로 `Inset`설정

<br>

### 4️⃣ Alert & Activity 재사용

#### 🔥 문제점
`AlertController`와 `ActivityViewController`의 코드를 모두 `ViewController`에 작성하니 `ViewController`가 너무 비대해지는 문제가 있었습니다.
또한 다른 `ViewController`에서 같은 `AlertController`를 생성 시 중복되는 코드를 재사용하지 못 한다는 단점도 있었습니다.

#### 🧯 해결방법
`AlertController`와 `ActivityViewController`의 코드를 재사용하기 위해 `Manager`를 만들어 `ViewController`에서 메서드를 호출하는 것만으로 `AlertController`와 `ActivityViewController`를 `present`할 수 있도록 했습니다.

**AlertManager**
```swift
enum AlertManager {
    
    static func presentFailAlert(to controller: UIViewController, with message: String) {
        let alertAction = UIAlertAction(title: "확인", style: .cancel)
        let alert = UIAlertController.customAlert(alertTile: "실패", alertMessage: message, preferredStyle: .alert, alertActions: [alertAction])
        
        controller.present(alert, animated: true)
    }
    
    static func presentDeleteAlert(to controller: UIViewController, with action: ((UIAlertAction) -> Void)?) {
        let alertAction = UIAlertAction(title: "삭제", style: .destructive, handler: action)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        let alert = UIAlertController.customAlert(alertTile: "진짜요?", alertMessage: "정말로 삭제하시겠어요?", preferredStyle: .alert, alertActions: [alertAction, cancelAction])
        
        controller.present(alert, animated: true)
    }
}
```

**ActivityViewManager**
```swift
enum ActivityViewManager {
    
    static func presentActivityView(to controller: UIViewController, with diary: DiaryEntry) {
        let diaryText = String(format: "%@\n%@", diary.title, diary.body)
        let activity = UIActivityViewController(activityItems: [diaryText], applicationActivities: nil)
        activity.popoverPresentationController?.sourceView = controller.view
        
        controller.present(activity, animated: true)
    }
}
```

<br>

### 5️⃣ Notification

#### 🔥 문제점
`saveContext()`에서 `context.save()`가 성공했을 때는 `coreDataUpdateSuccessNotification` 노티를 게시하고 실패했을 때 `coreDataUpdateFailNotification` 노티를 게시하여 `ViewController`에서 이를 관찰하여 실패 `alert`을 띄우거나 화면을 업데이트할 수 있도록 했습니다.
하지만 `notification`을 사용하여 코드의 흐름이 끊기게 되는 단점이 있었습니다.

#### 🧯 해결방법
`DiaryManageable` 타입에서 일기를 저장 및 삭제 작업 중 실패 했을 경우 에러를 `throw` 하도록 수정하였습니다.
그리고 `ViewController`에서 `do-catch`문으로 에러 처리를 하여 코드의 흐름이 이어질 수 있도록 했습니다.

**DiaryManageable**
```swift
protocol DiaryManageable {
    func storeDiary(_ diary: DiaryEntry) throws
    func deleteDiary(_ diary: DiaryEntry) throws
}
```

**DiaryViewController**
```swift
extension DiaryViewController: UITextViewDelegate {
    // ...
    
    func textViewDidEndEditing(_ textView: UITextView) {
        // ...
        
        do {
            if var diaryEntry {
                // ...
                try diaryManager.storeDiary(diaryEntry)
            } else {
                // ...
                try diaryManager.storeDiary(diaryEntry)
             }
        } catch {
            self.presentFailAlert()
        }
    }
}
```
- `storeDiary`로 일기 저장 작업 실행
- 저장 실패 시 `presentFailAlert` 호출

<br>

### 6️⃣ 프로토콜 분리

#### 🔥 문제점
`DiaryStorageProtocol`이 `Diary`의 `CRUD` 코드를 가지고 있도록 했습니다.
하지만 `AssetDiaryStorage`의 경우 `Read` 코드만 존재하여 나머지 `CUD` 코드를 구현해주지 못 한다는 문제가 있었습니다.

**DiaryStorageProtocol**
```swift
protocol DiaryStorageProtocol {
    func diaryEntrys() throws -> [DiaryEntry]
    func storeDiary(title: String, body: String?) throws
    func updateDiary(_ diary: DiaryEntry) throws
    func deleteDiary(_ diary: DiaryEntry) throws
}
```

**AssetDiaryStorage**
```swift
final class AssetDiaryStorage: DiaryStorageProtocol {
    
    func diaryEntrys() throws -> [DiaryEntry] {
        // ...
    }
    
    func storeDiary(title: String, body: String?) {
        
    }
    
    func updateDiary(_ diary: DiaryEntry) {
        
    }
    
    func deleteDiary(_ diary: DiaryEntry) {
        
    }
}
```

#### 🧯 해결방법
`DiaryStorageProtocol`을 `DiaryReadable`과 `DiaryManageable`로 분리하여 `AssetDiaryReader`은 `DiaryReadable`만 채택하도록 수정했습니다.

**DiaryReadable**
```swift
protocol DiaryReadable {
    func diaryEntrys() throws -> [DiaryEntry]
}

```

**DiaryManageable**
```swift
protocol DiaryManageable {
    func storeDiary(_ diary: DiaryEntry) throws
    func deleteDiary(_ diary: DiaryEntry) throws
}
```

**AssetDiaryReader**
```swift
final class AssetDiaryReader: DiaryReadable {
    
    func diaryEntrys() throws -> [DiaryEntry] {
        guard let asset = NSDataAsset(name: "sample"),
              let diarys = try? JSONDecoder().decode([Diary].self, from: asset.data) else {
            throw StorageError.loadDataFailed
        }
        
        let diaryEntrys = diarys.map {
            $0.diaryEntry()
        }
        
        return diaryEntrys
    }
}
```

<br>

### 7️⃣ NSPredicate

#### 🔥 문제점
`SQLite Type`의 `persistentContainer`를 사용할 때는 동작하던 `predicate`가 `CoreDataDiaryManagerTests`에서 `InMemory Type`의 `persistentContainer`를 주입 받아 테스트를 진행 시 `fetchRequest`에 `NSPredicate`를 주입 시켜도 원하는 데이터를 받아오지 못하는 문제가 있었습니다.

```swift
fetchRequest.predicate = NSPredicate(format: NameSpace.idEqualFormat, diary.id.uuidString)
```

#### 🧯 해결방법
`NSPredicate`에 `String` 타입인 `uuidString`을 넣는 것이 아닌 `CVarArg`로 타입 변환한 `UUID`를 넣어 해결하였습니다.

```swift
fetchRequest.predicate = NSPredicate(format: NameSpace.idEqualFormat, diary.id  as CVarArg)
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
