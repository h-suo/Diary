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

  func diarys() throws -> [Diary] {
    try repository.diarys()
  }
  
  func create(_ diary: Diary) throws {
    try repository.create(diary)
  }
  
  func update(_ diary: Diary) throws {
    try repository.update(diary)
  }
  
  func delete(_ diary: Diary) throws {
    try repository.delete(diary)
  }
}
