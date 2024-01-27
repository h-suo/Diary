//
//  DiaryDTO.swift
//  Diary
//
//  Created by Erick on 2024/01/18.
//
//

import CoreData

@objc(DiaryDTO)
final class DiaryDTO: NSManagedObject {
  
}

extension DiaryDTO {
  
  @nonobjc final class func fetchRequest() -> NSFetchRequest<DiaryDTO> {
    return NSFetchRequest<DiaryDTO>(entityName: NameSpace.diaryDTO)
  }
  
  @NSManaged var id: UUID
  @NSManaged var title: String
  @NSManaged var contents: String
  @NSManaged var date: Date
  @NSManaged var weatherID: String?
}

extension DiaryDTO : Identifiable {
  
}
