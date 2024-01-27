//
//  DiaryListViewModel.swift
//  Diary
//
//  Created by Erick on 2024/01/19.
//

import Combine
import Foundation

final class DiaryListViewModel: ObservableObject {
  
  @Published var diarys: [Diary] = []
  @Published var isError: Bool = false
  
  private(set) var errorMessage: String = String.empty
  
  private var cancelables: [AnyCancellable] = []
  private var useCase: DiaryUseCase
  
  init(useCase: DiaryUseCase) {
    self.useCase = useCase
  }
  
  func fetchDiarys() {
    do {
      self.diarys = try useCase.diarys().sorted { $0.date > $1.date }
      fetchWeatherIcon()
    } catch {
      errorMessage = error.localizedDescription
      isError = true
    }
  }
  
  func deleteDiary(_ diary: Diary) {
    do {
      try useCase.delete(diary)
      fetchDiarys()
    } catch {
      errorMessage = error.localizedDescription
      isError = true
    }
  }
  
  func shareItem(_ diary: Diary) -> String {
    String(format: NameSpace.share, diary.title, diary.contents)
  }
  
  private func fetchWeatherIcon() {
    for (index, diary) in diarys.enumerated()  {
      guard let weatherID = diary.weatherID
      else { continue }
      
      useCase.fetchWeatherIconPublisher(weatherID: weatherID)
        .receive(on: DispatchQueue.main)
        .sink { completion in
          if case .failure(let error) = completion {
            print(error.localizedDescription)
          }
        } receiveValue: { data in
          self.diarys[index].iconData = data
        }
        .store(in: &cancelables)
    }
  }
}
