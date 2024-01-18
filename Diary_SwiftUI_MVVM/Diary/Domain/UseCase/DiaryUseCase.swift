//
//  DiaryUseCase.swift
//  Diary
//
//  Created by Erick on 2024/01/16.
//

struct DiaryUseCase: DiaryRepository {
  
  private var repository: DiaryRepository
  
  init(repository: DiaryRepository) {
    self.repository = repository
  }

  func diarys() -> [Diary] {
    repository.diarys()
  }
  
  func create(_ diary: Diary) -> Diary? {
    repository.create(diary)
  }
  
  func update(_ diary: Diary) -> Diary? {
    repository.update(diary)
  }
  
  func delete(_ diary: Diary) -> Diary? {
    repository.delete(diary)
  }
}
