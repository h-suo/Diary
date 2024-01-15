//
//  DiaryEntry.swift
//  Diary
//
//  Created by Erick on 2023/08/29.
//

import Foundation

struct DiaryEntry: Hashable {
  
  // MARK: - Property
  let id: UUID
  var title: String
  var body: String
  let creationDate: String
  var weatherMain: String?
  var weatherIconID: String?
  
  // MARK: - Initializer
  init(
    id: UUID,
    title: String,
    body: String,
    creationDate: String,
    weatherMain: String? = nil,
    weatherIconID: String? = nil
  ) {
    self.id = id
    self.title = title
    self.body = body
    self.creationDate = creationDate
    self.weatherMain = weatherMain
    self.weatherIconID = weatherIconID
  }
}
