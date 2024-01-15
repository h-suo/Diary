//
//  Notification.name+.swift
//  Diary
//
//  Created by Erick on 2023/09/09.
//

import Foundation

extension Notification.Name {
  
  // MARK: - Static Property
  static let coreDataUpdateSuccessNotification = Notification.Name(
    "coreDataUpdateSuccessNotification"
  )
  static let coreDataUpdateFailNotification = Notification.Name(
    "coreDataUpdateFailedNotification"
  )
}
