//
//  DiaryDetailViewModel.swift
//  Diary
//
//  Created by Erick on 2024/01/22.
//

import Foundation

final class DiaryDetailViewModel: ObservableObject {
  
  @Published var diary: Diary
  @Published var isError: Bool = false
  
  private(set) var errorMessage: String = ""
  private(set) var isBack: Bool = false
  private(set) var isNew: Bool
  
  private var useCase: DiaryUseCase
  
  init(diary: Diary?, useCase: DiaryUseCase) {
    self.diary = diary ?? Diary(title: "", contents: "")
    self.isNew = diary == nil ? true : false
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
  
  func deleteDiary() {
    do {
      try useCase.delete(diary)
      isBack = true
    } catch {
      errorMessage = error.localizedDescription
      isError = true
    }
  }
  
  func shareItem() -> String {
    String(format: "%@\n%@", diary.title, diary.contents)
  }
}
