//
//  UserDateFormatter.swift
//  Diary
//
//  Created by Erick on 2023/08/29.
//

import Foundation

final class UserDateFormatter: LocaleDateFormatterProtocol {
    
    // MARK: - static Property
    static let shared = UserDateFormatter()
    
    // MARK: - Property
    var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateStyle = .long

        return dateFormatter
    }()
    
    // MARK: - Initializer
    private init() {}
}
