//
//  DiaryDetailViewModel.swift
//  Diary
//
//  Created by Erick on 2024/01/22.
//

import Foundation

final class DiaryDetailViewModel: ObservableObject {
  
  @Published var diary: Diary
  @Published var isBack: Bool = false
  @Published var isError: Bool = false
  @Published var errorMessage: String = ""
  
  private var useCase: DiaryUseCase
  
  init(diary: Diary?, useCase: DiaryUseCase) {
    self.diary = diary ?? Diary(title: "", contents: "")
    self.useCase = useCase
  }
  
  func updateDiary() {
    guard !diary.title.isEmpty else {
      errorMessage = "Enter a title."
      isError = true
      return
    }
    
    do {
      try useCase.update(diary)
      isBack = true
    } catch {
      errorMessage = error.localizedDescription
      isError = true
    }
  }
}
