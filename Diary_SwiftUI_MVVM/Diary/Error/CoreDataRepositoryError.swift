//
//  CoreDataRepositoryError.swift
//  Diary
//
//  Created by Erick on 2024/01/18.
//

import Foundation

enum CoreDataRepositoryError: LocalizedError {
  case fetchError
  case creationError
  case updateError
  case deletionError
  
  var errorDescription: String? {
    switch self {
    case .fetchError:
      return "데이터를 가져오는데 실패했습니다."
    case .creationError:
      return "데이터를 생성하는데 실패했습니다."
    case .updateError:
      return "데이터를 업데이트하는데 실패했습니다."
    case .deletionError:
      return "데이터를 삭제하는데 실패했습니다."
    }
  }
}
