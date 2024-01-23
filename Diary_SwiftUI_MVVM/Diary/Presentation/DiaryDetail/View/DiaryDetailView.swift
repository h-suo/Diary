//
//  DiaryDetailView.swift
//  Diary
//
//  Created by Erick on 2024/01/15.
//

import SwiftUI

struct DiaryDetailView: View {
  
  @EnvironmentObject
  private var viewModel: DiaryDetailViewModel
  
  @Environment(\.dismiss) private var dismiss
  
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
    .navigationTitle(viewModel.diary.dateString)
    .navigationBarBackButtonHidden(true)
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) { backButton }
      ToolbarItem { moreMenu }
    }
  }
  
  private var titleTextField: some View {
    TextField("Enter a title.", text: $viewModel.diary.title)
      .font(.title2)
  }
  
  private func contentsTextEditor(
    _ geometry: GeometryProxy
  ) -> some View {
    TextEditor(text: $viewModel.diary.contents)
      .scrollDisabled(true)
      .frame(minWidth: geometry.size.height * 0.8)
  }
  
  private var backButton: some View {
    Button {
      viewModel.updateDiary()
      if viewModel.isBack { dismiss() }
    } label: {
      HStack {
        Image(systemName: "chevron.left")
        Text("Diary")
      }
    }
    .alert(isPresented: $viewModel.isError) {
      Alert(title: Text(viewModel.errorMessage))
    }
  }
  
  private var moreMenu: some View {
    Menu {
      ShareLink(item: viewModel.shareItem()) {
        Text("Share")
      }
      
      Button("Delete", role: .destructive) {
        viewModel.deleteDiary()
        if viewModel.isBack { dismiss() }
      }
    } label: {
      Image(systemName: "ellipsis")
    }
    .disabled(viewModel.isNew)
  }
}

struct DiaryEditView_Previews: PreviewProvider {
  static var previews: some View {
    DiaryDetailView()
      .environmentObject(DIContainer.shared.diaryDetailViewModel(diary: nil))
  }
}
