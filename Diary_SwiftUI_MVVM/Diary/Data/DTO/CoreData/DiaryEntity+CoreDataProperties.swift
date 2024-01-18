//
//  DiaryEntity+CoreDataProperties.swift
//  Diary
//
//  Created by Erick on 2024/01/18.
//
//

import Foundation
import CoreData


extension DiaryDTO {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<DiaryDTO> {
    return NSFetchRequest<DiaryDTO>(entityName: "DiaryDTO")
  }
  
  @NSManaged public var id: UUID
  @NSManaged public var title: String
  @NSManaged public var contents: String
  @NSManaged public var date: Date
}

extension DiaryDTO : Identifiable {
  
}
