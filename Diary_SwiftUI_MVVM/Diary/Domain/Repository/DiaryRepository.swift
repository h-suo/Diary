//
//  DiaryRepository.swift
//  Diary
//
//  Created by Erick on 2024/01/16.
//

protocol DiaryRepository {
  func diarys() -> [Diary]
  func create(_ diary: Diary) -> Diary?
  func update(_ diary: Diary) -> Diary?
  func delete(_ diary: Diary) -> Diary?
}
