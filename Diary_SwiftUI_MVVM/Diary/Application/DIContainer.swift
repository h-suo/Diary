//
//  DIContainer.swift
//  Diary
//
//  Created by Erick on 2024/01/22.
//

struct DIContainer {
  
  static let shared = DIContainer()
  
  private var useCase: DiaryUseCase = DiaryUseCase(
    repository: DiaryCoreDataRepository(
      persistentContainer: PersistenceController.shared.container
    ),
    weatherService: WeatherNetworkService(),
    locationService: LocationManagerService()
  )
  
  func diaryListViewModel() -> DiaryListViewModel {
    DiaryListViewModel(useCase: useCase)
  }
  
  func diaryDetailViewModel(diary: Diary?) -> DiaryDetailViewModel {
    DiaryDetailViewModel(diary: diary, useCase: useCase)
  }
}
