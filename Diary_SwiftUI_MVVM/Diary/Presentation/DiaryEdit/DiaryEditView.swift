//
//  DiaryEditView.swift
//  Diary
//
//  Created by 표현수 on 2024/01/15.
//

import SwiftUI

struct DiaryEditView: View {
  
  // MARK: - Data Property
  @State var diary: Diary
  
  // MARK: - Body
  var body: some View {
    GeometryReader { geometry in
      ScrollView {
        VStack(alignment: .leading) {
          TextField("Enter a title.", text: $diary.title)
            .font(.title2)
          
          Divider()
          
          TextEditor(text: $diary.contents)
            .scrollDisabled(true)
            .frame(height: geometry.size.height * 0.9)
        }
      }
    }
    .padding()
    .navigationTitle(diary.dateString)
  }
}

struct DiaryEditView_Previews: PreviewProvider {
  static var previews: some View {
    DiaryEditView(diary: Diary(title: "Title",
                               contents: "Contents"))
  }
}
