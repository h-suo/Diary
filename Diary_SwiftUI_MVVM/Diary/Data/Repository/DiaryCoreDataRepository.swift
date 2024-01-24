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
  
  private func fetchDiaryEntity(forId id: UUID) throws -> DiaryDTO? {
    let request = DiaryDTO.fetchRequest()
    request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
    
    return try context.fetch(request).first
  }
}

extension DiaryCoreDataRepository: DiaryRepository {
  
  func diarys() throws -> [Diary] {
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
      throw CoreDataRepositoryError.fetch(error)
    }
  }
  
  func update(_ diary: Diary) throws {
    if let diaryEntity = try? fetchDiaryEntity(forId: diary.id) {
      diaryEntity.title = diary.title
      diaryEntity.contents = diary.contents
    } else {
      let newDiaryEntity = DiaryDTO(context: context)
      newDiaryEntity.id = diary.id
      newDiaryEntity.title = diary.title
      newDiaryEntity.contents = diary.contents
      newDiaryEntity.date = diary.date
    }
    
    do {
      try context.save()
    } catch {
      throw CoreDataRepositoryError.update(error)
    }
  }
  
  func delete(_ diary: Diary) throws {
    guard let diaryEntity = try? fetchDiaryEntity(forId: diary.id)
    else { throw CoreDataRepositoryError.fetchFailed }
    
    context.delete(diaryEntity)
    
    do {
      try context.save()
    } catch {
      throw CoreDataRepositoryError.deletion(error)
    }
  }
}
