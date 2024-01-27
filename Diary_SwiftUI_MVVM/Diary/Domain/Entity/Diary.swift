//
//  Diary.swift
//  Diary
//
//  Created by Erick on 2024/01/15.
//

import Foundation

struct Diary: Identifiable {
  
  var id: UUID
  var title: String
  var contents: String
  var date: Date
  var weatherID: String?
  var iconData: Data?
  
  var dateString: String {
    DateFormatter.currentLong.string(from: date)
  }
  
  init(
    id: UUID = UUID(),
    title: String,
    contents: String,
    date: Date = Date(),
    weatherID: String? = nil
  ) {
    self.id = id
    self.title = title
    self.contents = contents
    self.date = date
    self.weatherID = weatherID
  }
}

extension Diary {
  static let dummyDiary: Diary = {
    return Diary(title: "Title", contents: "Contents")
  }()
}
