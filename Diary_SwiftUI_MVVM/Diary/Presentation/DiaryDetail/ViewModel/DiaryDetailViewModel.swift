//
//  DiaryDetailViewModel.swift
//  Diary
//
//  Created by Erick on 2024/01/22.
//

import Combine
import Foundation
import SwiftErickNetwork

final class DiaryDetailViewModel: ObservableObject {
  
  @Published var diary: Diary
  @Published var isError: Bool = false
  @Published var isBack: Bool = false
  
  private(set) var errorMessage: String = String.empty
  private(set) var isNew: Bool
  
  private var cancelables: [AnyCancellable] = []
  private var useCase: DiaryUseCase
  
  init(diary: Diary?, useCase: DiaryUseCase) {
    self.diary = diary ?? Diary(title: String.empty, contents: String.empty)
    self.isNew = diary == nil ? true : false
    self.useCase = useCase
  }
  
  func storeDiary() {
    guard !diary.title.isEmpty else {
      errorMessage = NameSpace.enterTitle
      isError = true
      return
    }
    
    if isNew {
      createDiary()
    } else {
      updateDiary()
    }
  }
  
  func deleteDiary() {
    do {
      try useCase.delete(diary)
      isBack = true
    } catch {
      print(error.localizedDescription)
      errorMessage = NameSpace.diaryDeletionFailed
      isError = true
    }
  }
  
  func shareItem() -> String {
    String(format: NameSpace.shareFormat, diary.title, diary.contents)
  }
  
  private func createDiary() {
    useCase.requestLoactionPublisher()
      .mapError { _ in NetworkError.invalidComponents }
      .flatMap { [weak self] location in
        guard let self
        else {
          return Fail<Weather, NetworkError>(error: NetworkError.emptyData)
            .eraseToAnyPublisher()
        }
        
        return self.useCase.fetchWeatherPublisher(location: location)
      }
      .receive(on: DispatchQueue.main)
      .sink { [weak self] completion in
        if case .failure(let error) = completion {
          print(error.localizedDescription)
          self?.errorMessage = NameSpace.weatherFetchFailed
          self?.isError = true
        }
      } receiveValue: { [weak self] weather in
        self?.diary.weatherID = weather.icon
        self?.updateDiary()
      }
      .store(in: &cancelables)
  }
  
  private func updateDiary() {
    do {
      try useCase.update(diary)
      isBack = true
    } catch {
      print(error.localizedDescription)
      errorMessage = NameSpace.diaryUpdateFailed
      isError = true
    }
  }
}
