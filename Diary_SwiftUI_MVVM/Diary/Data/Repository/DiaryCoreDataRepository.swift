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
    request.predicate = NSPredicate(format: NameSpace.idFormate, id as CVarArg)
    
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
          date: $0.date,
          weatherID: $0.weatherID
        )
      }
    } catch {
      throw DiaryRepositoryError.fetch(error)
    }
  }
  
  func update(_ diary: Diary) throws {
    if let diaryDTO = try? fetchDiaryEntity(forId: diary.id) {
      diaryDTO.title = diary.title
      diaryDTO.contents = diary.contents
      diaryDTO.weatherID = diary.weatherID
    } else {
      let newDiaryDTO = DiaryDTO(context: context)
      newDiaryDTO.id = diary.id
      newDiaryDTO.title = diary.title
      newDiaryDTO.contents = diary.contents
      newDiaryDTO.date = diary.date
      newDiaryDTO.weatherID = diary.weatherID
    }
    
    do {
      try context.save()
    } catch {
      throw DiaryRepositoryError.update(error)
    }
  }
  
  func delete(_ diary: Diary) throws {
    guard let diaryEntity = try? fetchDiaryEntity(forId: diary.id)
    else { throw DiaryRepositoryError.fetchFailed }
    
    context.delete(diaryEntity)
    
    do {
      try context.save()
    } catch {
      throw DiaryRepositoryError.deletion(error)
    }
  }
}
