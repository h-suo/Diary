//
//  DIContainer.swift
//  Diary
//
//  Created by Erick on 2024/01/22.
//

struct DIContainer {
  
  static let shared = DIContainer()
  static let preview = DIContainer(isPreview: true)
  
  private var useCase: DiaryUseCase
  
  init(isPreview: Bool = false) {
    if isPreview {
      self.useCase =  DiaryUseCase(
        repository: DiaryCoreDataRepository(
          persistentContainer: PersistenceController.preview.container
        ),
        weatherService: WeatherNetworkService(),
        locationService: LocationManagerService()
      )
    } else {
      self.useCase =  DiaryUseCase(
        repository: DiaryCoreDataRepository(
          persistentContainer: PersistenceController.shared.container
        ),
        weatherService: WeatherNetworkService(),
        locationService: LocationManagerService()
      )
    }
  }
  
  func diaryListViewModel() -> DiaryListViewModel {
    DiaryListViewModel(useCase: useCase)
  }
  
  func diaryDetailViewModel(diary: Diary?) -> DiaryDetailViewModel {
    DiaryDetailViewModel(diary: diary, useCase: useCase)
  }
}
