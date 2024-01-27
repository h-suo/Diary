//
//  PersistenceController.swift
//  Diary
//
//  Created by Erick on 2024/01/18.
//

import CoreData

struct PersistenceController {
  
  static let shared = PersistenceController()
  
  static var preview: PersistenceController = {
    let result = PersistenceController(inMemory: true)
    let viewContext = result.container.viewContext
    
    for _ in 0..<10 {
      let newDiaryDTO = DiaryDTO(context: viewContext)
      newDiaryDTO.id = UUID()
      newDiaryDTO.title = NameSpace.title
      newDiaryDTO.contents = NameSpace.contents
      newDiaryDTO.date = Date()
      newDiaryDTO.weatherID = NameSpace.testWeatherID
    }
    
    do {
      try viewContext.save()
    } catch {
      let nsError = error as NSError
      fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    }
    
    return result
  }()
  
  let container: NSPersistentContainer
  
  init(inMemory: Bool = false) {
    
    container = NSPersistentContainer(name: NameSpace.diary)
    
    if inMemory {
      container.persistentStoreDescriptions.first!.url = URL(
        fileURLWithPath: NameSpace.inMemoryPath
      )
    }
    
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    
    container.viewContext.automaticallyMergesChangesFromParent = true
  }
}
