//
//  DiaryRepository.swift
//  Diary
//
//  Created by Erick on 2024/01/16.
//

protocol DiaryRepository {
  func diarys() throws -> [Diary]
  func create(_ diary: Diary) throws
  func update(_ diary: Diary) throws
  func delete(_ diary: Diary) throws
}
