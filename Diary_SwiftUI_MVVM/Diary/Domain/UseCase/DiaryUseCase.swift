//
//  DiaryUseCase.swift
//  Diary
//
//  Created by Erick on 2024/01/16.
//

struct DiaryUseCase: DiaryRepository {
  
  private var repo: DiaryRepository

  func diarys() -> [Diary] {
    repo.diarys()
  }
  
  func create(_ diary: Diary) -> Diary? {
    repo.create(diary)
  }
  
  func update(_ diary: Diary) -> Diary? {
    repo.update(diary)
  }
  
  func delete(_ diary: Diary) -> Diary? {
    repo.delete(diary)
  }
}
