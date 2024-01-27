//
//  DiaryRowView.swift
//  Diary
//
//  Created by Erick on 2024/01/15.
//

import SwiftUI

struct DiaryRowView: View {
  
  private var diary: Diary
  
  init(diary: Diary) {
    self.diary = diary
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      titleText
      
      HStack {
        dateText
        iconImage
        contentsText
      }
    }
    .lineLimit(1)
  }
  
  private var titleText: some View {
    Text(diary.title)
      .font(.title2)
  }
  
  private var dateText: some View {
    Text(diary.dateString)
      .font(.title3)
      .foregroundColor(.gray)
      .layoutPriority(1)
  }
  
  private var iconImage: some View {
    if let iconData = diary.iconData,
       let image = UIImage(data: iconData) {
      return Image(uiImage: image)
        .resizable()
        .scaledToFit()
        .frame(width: 24)
    } else {
      return Image(systemName: NameSpace.systemNameAntennaSlash)
        .resizable()
        .scaledToFit()
        .frame(width: 20)
    }
  }
  
  private var contentsText: some View {
    Text(diary.contents)
  }
}

struct DiaryRowView_Previews: PreviewProvider {
  static var previews: some View {
    DiaryRowView(diary: Diary.dummyDiary)
  }
}
