//
//  DiaryApp.swift
//  Diary
//
//  Created by Erick on 2024/01/15.
//

import SwiftUI

@main
struct DiaryApp: App {
  var body: some Scene {
    WindowGroup {
      DiaryListView(diarys: Diary.makeDummyDiarys())
    }
  }
}
