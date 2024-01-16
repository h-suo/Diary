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
  var dateString: String {
    DateFormatter.currentLong.string(from: date)
  }
  
  init(
    id: UUID = UUID(),
    title: String,
    contents: String,
    date: Date = Date()
  ) {
    self.id = id
    self.title = title
    self.contents = contents
    self.date = date
  }
}

extension Diary {
  static func makeDummyDiary() -> Diary {
    return Diary(title: "Title", contents: "Contents")
  }
  
  static func makeDummyDiarys() -> [Diary] {
    return [Diary(title: "Title", contents: "Contents"),
            Diary(title: "Title", contents: "Contents"),
            Diary(title: "Title", contents: "Contents"),
            Diary(title: "Title", contents: "Contents"),
            Diary(title: "Title", contents: "Contents"),
            Diary(title: "Title", contents: "Contents"),
            Diary(title: "Title", contents: "Contents"),
            Diary(title: "Title", contents: "Contents"),
            Diary(title: "Title", contents: "Contents"),
            Diary(title: "Title", contents: "Contents"),
            Diary(title: "Title", contents: "Contents"),
            Diary(title: "Title", contents: "Contents"),
            Diary(title: "Title", contents: "Contents"),
            Diary(title: "Title", contents: "Contents"),
            Diary(title: "Title", contents: "Contents")]
  }
}
