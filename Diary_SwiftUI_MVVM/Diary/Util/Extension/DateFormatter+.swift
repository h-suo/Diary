//
//  DateFormatter+.swift
//  Diary
//
//  Created by Erick on 2024/01/15.
//

import Foundation

extension DateFormatter {
  
  static let currentLong: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale.current
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.dateStyle = .long
    
    return dateFormatter
  }()
}
