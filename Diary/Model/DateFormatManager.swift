//
//  DateFormatManager.swift
//  Diary
//
//  Created by Erick on 2023/08/29.
//

import Foundation

enum DateFormatManager {
    
    static func string(localeDateFormatter: LocaleDateFormatterProtocol, timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: Double(timestamp))
        
        return localeDateFormatter.string(from: date)
    }
}