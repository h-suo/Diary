//
//  DiaryListViewModel.swift
//  Diary
//
//  Created by Erick on 2024/01/19.
//

import Foundation

final class DiaryListViewModel: ObservableObject {
  
  @Published var diarys: [Diary] = []
  
  private var useCase: DiaryUseCase
  
  init(useCase: DiaryUseCase) {
    self.useCase = useCase
  }
  
  func fetchDiarys() {
    do {
      self.diarys = try useCase.diarys().sorted { $0.date > $1.date }
    } catch {
      print(error.localizedDescription)
    }
  }
  
  func addDiary() {
    do {
      try useCase.create(Diary(title: "", contents: ""))
      fetchDiarys()
    } catch {
      print(error.localizedDescription)
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
      print(error.localizedDescription)
    }
  }
}
