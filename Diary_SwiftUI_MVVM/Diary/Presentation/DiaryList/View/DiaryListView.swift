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
      List {
        ForEach(viewModel.diarys) { diary in
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
        .onDelete(perform: viewModel.deleteDiary)
      }
      .listStyle(.plain)
      .navigationTitle("Diary")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem {
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
      .onAppear {
        viewModel.fetchDiarys()
      }
    }
    .alert(isPresented: $viewModel.isError) {
      Alert(title: Text(viewModel.errorMessage))
    }
  }
}

struct DiaryListView_Previews: PreviewProvider {
  static var previews: some View {
    DiaryListView()
      .environmentObject(DIContainer.shared.diaryListViewModel())
  }
}
