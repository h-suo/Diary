//
//  DiaryListView.swift
//  Diary
//
//  Created by Erick on 2024/01/15.
//

import SwiftUI

struct DiaryListView: View {
  
  var diarys: [Diary]
  
  var body: some View {
    NavigationStack {
      List(diarys) { diary in
        NavigationLink {
          DiaryEditView(diary: diary)
        } label: {
          DiaryRowView(diary: diary)
        }
      }
      .listStyle(.plain)
      .navigationTitle("Diary")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct DiaryListView_Previews: PreviewProvider {
  static var previews: some View {
    DiaryListView(diarys: Diary.makeDummyDiarys())
  }
}
