//
//  DiaryApp.swift
//  Diary
//
//  Created by Erick on 2024/01/15.
//

import SwiftUI

@main
struct DiaryApp: App {
  
  @State var useCase = DiaryUseCase(
    repository: DiaryCoreDataRepository(
      persistentContainer: PersistenceController.preview.container
    )
  )
  
  var body: some Scene {
    WindowGroup {
      DiaryListView()
        .environmentObject(DiaryListViewModel(useCase: useCase))
    }
  }
}
