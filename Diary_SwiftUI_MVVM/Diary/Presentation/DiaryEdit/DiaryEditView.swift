//
//  DiaryEditView.swift
//  Diary
//
//  Created by Erick on 2024/01/15.
//

import SwiftUI

struct DiaryEditView: View {
  
  @State var diary: Diary
  
  var body: some View {
    GeometryReader { geometry in
      ScrollView {
        VStack(alignment: .leading) {
          titleTextField
          Divider()
          contentsTextEditor(geometry)
        }
      }
    }
    .padding()
    .navigationTitle(diary.dateString)
  }
  
  private var titleTextField: some View {
    TextField("Enter a title.", text: $diary.title)
      .font(.title2)
  }
  
  private func contentsTextEditor(
    _ geometry: GeometryProxy
  ) -> some View {
    TextEditor(text: $diary.contents)
      .scrollDisabled(true)
      .frame(height: geometry.size.height * 0.9)
  }
}

struct DiaryEditView_Previews: PreviewProvider {
  static var previews: some View {
    DiaryEditView(diary: Diary.makeDummyDiary())
  }
}
