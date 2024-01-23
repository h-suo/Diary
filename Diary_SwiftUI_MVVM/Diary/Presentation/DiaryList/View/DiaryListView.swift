//
//  DiaryListView.swift
//  Diary
//
//  Created by Erick on 2024/01/15.
//

import SwiftUI

struct DiaryListView: View {
  
  @EnvironmentObject
  private var viewModel: DiaryListViewModel
  
  var body: some View {
    NavigationStack {
      List(viewModel.diarys) { diary in
        diaryDetailViewLink(diary)
        .swipeActions {
          deleteButton(diary)
          diaryShareLink(diary)
        }
      }
      .listStyle(.plain)
      .navigationTitle("Diary")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar { ToolbarItem { diaryDetailViewLink } }
      .onAppear { viewModel.fetchDiarys() }
    }
    .alert(isPresented: $viewModel.isError) {
      Alert(title: Text(viewModel.errorMessage))
    }
  }
  
  private func diaryDetailViewLink(_ diary: Diary) -> some View {
    NavigationLink {
      DiaryDetailView()
        .environmentObject(
          DIContainer
            .shared
            .diaryDetailViewModel(diary: diary)
        )
    } label: {
      DiaryRowView(diary: diary)
    }
  }
  
  private func deleteButton(_ diary: Diary) -> some View {
    Button("Delete", role: .destructive) {
      viewModel.deleteDiary(diary)
    }
  }
  
  private func diaryShareLink(_ diary: Diary) -> some View {
    ShareLink(item: viewModel.shareItem(diary)) {
      Text("Share")
    }
  }
  
  private var diaryDetailViewLink: some View {
    NavigationLink {
      DiaryDetailView()
        .environmentObject(
          DIContainer
            .shared
            .diaryDetailViewModel(diary: nil)
        )
    } label: {
      Image(systemName: "plus")
    }
  }
}

struct DiaryListView_Previews: PreviewProvider {
  static var previews: some View {
    DiaryListView()
      .environmentObject(DIContainer.shared.diaryListViewModel())
  }
}
