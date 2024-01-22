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
  @Published var errorMessage: String = ""
  
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
  
  func deleteDiary(_ offsets: IndexSet) {
    do {
      try offsets
        .map { self.diarys[$0] }
        .forEach {
          try useCase.delete($0)
          fetchDiarys()
        }
    } catch {
      errorMessage = error.localizedDescription
      isError = true
    }
  }
}
