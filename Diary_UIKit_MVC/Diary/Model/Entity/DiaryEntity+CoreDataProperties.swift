//
//  DiaryEntity+CoreDataProperties.swift
//  Diary
//
//  Created by Erick on 2023/09/08.
//
//

import CoreData
import Foundation

extension DiaryEntity {
  
  @nonobjc final class func fetchRequest() -> NSFetchRequest<DiaryEntity> {
    return NSFetchRequest<DiaryEntity>(entityName: "DiaryEntity")
  }
  
  @NSManaged var id: UUID
  @NSManaged var title: String
  @NSManaged var body: String?
  @NSManaged var creationDate: Date
  @NSManaged var weatherMain: String?
  @NSManaged var weatherIconID: String?
}

extension DiaryEntity: Identifiable {
  
}

extension DiaryEntity {
  
  func diaryEntry() -> DiaryEntry {
    let timeStamp = DateFormatManager.timestamp(date: creationDate)
    let dateFormatString = DateFormatManager.string(
      localeDateFormatter: UserDateFormatter.shared,
      timestamp: timeStamp
    )
    
    return DiaryEntry(
      id: id,
      title: title,
      body: body ?? NameSpace.empty,
      creationDate: dateFormatString,
      weatherMain: weatherMain,
      weatherIconID: weatherIconID
    )
  }
}
