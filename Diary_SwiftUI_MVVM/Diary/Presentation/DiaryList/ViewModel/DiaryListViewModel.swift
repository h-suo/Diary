//
//  DiaryListViewModel.swift
//  Diary
//
//  Created by Erick on 2024/01/19.
//

import Foundation

final class DiaryListViewModel: ObservableObject {
  
  @Published var diarys: [Diary] = []
  @Published var isError: Bool = false
  
  private(set) var errorMessage: String = ""
  
  private var useCase: DiaryUseCase
  
  init(useCase: DiaryUseCase) {
    self.useCase = useCase
  }
  
  func fetchDiarys() {
    do {
      self.diarys = try useCase.diarys().sorted { $0.date > $1.date }
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
    String(format: "%@\n%@", diary.title, diary.contents)
  }
}
