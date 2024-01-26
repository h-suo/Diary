//
//  DiaryRepositoryError.swift
//  Diary
//
//  Created by Erick on 2024/01/18.
//

import Foundation

enum DiaryRepositoryError: LocalizedError {
  case fetchFailed
  case fetch(Error)
  case update(Error)
  case deletion(Error)
  
  var errorDescription: String? {
    switch self {
    case .fetchFailed:
      return "데이터를 가져오는데 실패했습니다."
    case .fetch(let error):
      return "데이터를 가져오는 과정에서 다음 에러가 발생했습니다.: \(error.localizedDescription)"
    case .update(let error):
      return "데이터를 업데이트하는 과정에서 다음 에러가 발생했습니다.: \(error.localizedDescription)"
    case .deletion(let error):
      return "데이터를 삭제하는 과정에서 다음 에러가 발생했습니다.: \(error.localizedDescription)"
    }
  }
}
