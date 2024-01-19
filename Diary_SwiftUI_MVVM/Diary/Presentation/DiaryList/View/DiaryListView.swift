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
            DiaryEditView(diary: diary)
          } label: {
            DiaryRowView(diary: diary)
          }
        }
        .onDelete(perform: viewModel.deleteDiary)
      }
      .listStyle(.plain)
      .navigationTitle("Diary")
      .navigationBarTitleDisplayMode(.inline)
      .onAppear {
        viewModel.fetchDiarys()
      }
    }
  }
}

struct DiaryListView_Previews: PreviewProvider {
  
  @State static var useCase = DiaryUseCase(
    repository: DiaryCoreDataRepository(
      persistentContainer: PersistenceController.preview.container
    )
  )
  
  static var previews: some View {
    DiaryListView()
      .environmentObject(DiaryListViewModel(useCase: useCase))
  }
}
