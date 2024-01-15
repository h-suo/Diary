//
//  DiaryRowView.swift
//  Diary
//
//  Created by Erick on 2024/01/15.
//

import SwiftUI

struct DiaryRowView: View {
  
  // MARK: - Data Property
  var diary: Diary
  
  // MARK: - Body View
  var body: some View {
    VStack(alignment: .leading) {
      Text(diary.title)
        .font(.title2)
      
      HStack {
        Text(diary.dateString)
          .font(.title3)
          .foregroundColor(.gray)
          .layoutPriority(1)
        
        Text(diary.contents)
      }
    }
    .lineLimit(1)
  }
}

// MARK: - Previews
struct DiaryRowView_Previews: PreviewProvider {
  static var previews: some View {
    DiaryRowView(diary: Diary(title: "Title",
                              contents: "Contents"))
  }
}
