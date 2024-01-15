//
//  DiaryListView.swift
//  Diary
//
//  Created by Erick on 2024/01/15.
//

import SwiftUI

struct DiaryListView: View {
  
  // MARK: - Data Property
  var diarys: [Diary]
  
  // MARK: - Body View
  var body: some View {
    NavigationStack {
      List(diarys) { diary in
        NavigationLink {
          Text("Diary Detail")
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

// MARK: - Previews
struct DiaryListView_Previews: PreviewProvider {
  static var previews: some View {
    DiaryListView(diarys: [
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
      Diary(title: "Title", contents: "Contents"),
      Diary(title: "Title", contents: "Contents")
    ])
  }
}
