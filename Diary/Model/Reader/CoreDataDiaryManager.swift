//
//  CoreDataDiaryStorage.swift
//  Diary
//
//  Created by Erick on 2023/09/04.
//

import CoreData
import UIKit

final class CoreDataDiaryManager {
  
  // MARK: - Private Property
  private let persistentContainer: NSPersistentContainer
  
  private var context: NSManagedObjectContext {
    return persistentContainer.viewContext
  }
  
  // MARK: - Initializer
  init(persistentContainer: NSPersistentContainer) {
    self.persistentContainer = persistentContainer
  }
  
  // MARK: - Save Context
  private func saveContext() throws {
    if context.hasChanges {
      try context.save()
    } else {
      throw StorageError.saveDataFailed
    }
  }
}

// MARK: - Read Diary
extension CoreDataDiaryManager: DiaryReadable {
  func diaryEntrys() throws -> [DiaryEntry] {
    let diaryEntitys = try context.fetch(DiaryEntity.fetchRequest())
    let diaryEntrys = diaryEntitys.map {
      $0.diaryEntry()
    }
    
    return diaryEntrys
  }
}

// MARK: - Manage Diary
extension CoreDataDiaryManager: DiaryManageable {
  func createDiary(
    title: String,
    body: String,
    weatherResponse: WeatherResponse?
  ) throws {
    let diaryEntity = DiaryEntity(context: context)
    diaryEntity.id = UUID()
    diaryEntity.title = title
    diaryEntity.body = body
    diaryEntity.creationDate = Date()
    
    if let weather = weatherResponse?.weather.first {
      diaryEntity.weatherMain = weather.main
      diaryEntity.weatherIconID = weather.icon
    }
    
    try saveContext()
  }
  
  func updateDiary(_ diary: DiaryEntry) throws {
    let fetchRequest = DiaryEntity.fetchRequest()
    fetchRequest.predicate = NSPredicate(
      format: NameSpace.idEqualFormat,
      diary.id as CVarArg
    )
    
    if let diaryEntity = try context.fetch(fetchRequest).first {
      diaryEntity.title = diary.title
      diaryEntity.body = diary.body
    }
    
    try saveContext()
  }
  
  func deleteDiary(_ diary: DiaryEntry) throws {
    let fetchRequest = DiaryEntity.fetchRequest()
    fetchRequest.predicate = NSPredicate(
      format: NameSpace.idEqualFormat,
      diary.id as CVarArg
    )
    
    if let diaryEntity = try context.fetch(fetchRequest).first {
      context.delete(diaryEntity)
    }
    
    try saveContext()
  }
  
  func deleteAll() throws {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: NameSpace.diaryEntity)
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
    
    try context.execute(deleteRequest)
  }
}
