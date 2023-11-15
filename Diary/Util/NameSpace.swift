//
//  NameSpace.swift
//  Diary
//
//  Created by Erick on 2023/11/15.
//

import Foundation

enum NameSpace {
    static let diaryData = "DiaryData"
    static let diaryEntity = "DiaryEntity"
    static let plus = "plus"
    static let ellipsis = "ellipsis"
    static let empty = ""
    static let enter = "\n"
    static let fullPathFormat = "%@/%@"
    static let idEqualFormat = "id == %@"
    static let diaryFormat = "%@\n%@"
    
    // MARK: - Localizable
    static let diary = String(format: NSLocalizedString("Diary", comment: ""))
    static let delete = String(format: NSLocalizedString("Delete", comment: ""))
    static let share = String(format: NSLocalizedString("Share", comment: ""))
    static let cancel = String(format: NSLocalizedString("Cancel", comment: ""))
    static let done = String(format: NSLocalizedString("Done", comment: ""))
    static let ok = String(format: NSLocalizedString("OK", comment: ""))
    static let fail = String(format: NSLocalizedString("Fail", comment: ""))
    static let failLoadData = String(format: NSLocalizedString("FailLoadData", comment: ""))
    static let failOperation = String(format: NSLocalizedString("FailOperation", comment: ""))
    static let deleteMessage = String(format: NSLocalizedString("DeleteMessage", comment: ""))
}
