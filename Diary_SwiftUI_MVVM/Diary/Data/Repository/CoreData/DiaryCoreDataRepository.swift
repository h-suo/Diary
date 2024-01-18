//
//  DiaryCoreDataRepository.swift
//  Diary
//
//  Created by Erick on 2024/01/18.
//

import CoreData

struct DiaryCoreDataRepository {
  
  private let persistentContainer: NSPersistentContainer
  
  private var context: NSManagedObjectContext {
    return persistentContainer.viewContext
  }
  
  init(persistentContainer: NSPersistentContainer) {
    self.persistentContainer = persistentContainer
  }
}

extension DiaryCoreDataRepository: DiaryRepository {
  
  func diarys() -> [Diary] {
    let request = DiaryDTO.fetchRequest()
    
    do {
      let diaryEntitys = try context.fetch(request)
      return diaryEntitys.map {
        Diary(
          id: $0.id,
          title: $0.title,
          contents: $0.contents,
          date: $0.date
        )
      }
    } catch {
      print(error.localizedDescription)
      return []
    }
  }
  
  func create(_ diary: Diary) -> Diary? {
    let newDiaryEntity = DiaryDTO(context: context)
    newDiaryEntity.id = diary.id
    newDiaryEntity.title = diary.title
    newDiaryEntity.contents = diary.contents
    newDiaryEntity.date = diary.date
    
    do {
      try context.save()
      return diary
    } catch {
      print(error.localizedDescription)
      return nil
    }
  }
  
  func update(_ diary: Diary) -> Diary? {
    let request = DiaryDTO.fetchRequest()
    request.predicate = NSPredicate(format: "id == %@", diary.id as CVarArg)
    
    do {
      guard let diaryEntity = try context.fetch(request).first else {
        print("Can't find target diary")
        return nil
      }
      
      diaryEntity.title = diary.title
      diaryEntity.contents = diary.contents
      
      try context.save()
      return diary
    } catch {
      print(error.localizedDescription)
      return nil
    }
  }
  
  func delete(_ diary: Diary) -> Diary? {
    let request = DiaryDTO.fetchRequest()
    request.predicate = NSPredicate(format: "id == %@", diary.id as CVarArg)
    
    do {
      guard let diaryEntity = try context.fetch(request).first else {
        print("Can't find target diary")
        return nil
      }
      
      context.delete(diaryEntity)
      
      try context.save()
      return diary
    } catch {
      print(error.localizedDescription)
      return nil
    }
  }
}
