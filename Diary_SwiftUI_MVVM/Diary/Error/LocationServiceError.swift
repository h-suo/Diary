//
//  LocationServiceError.swift
//  Diary
//
//  Created by Erick on 2024/01/26.
//

import Foundation

enum LocationServiceError: LocalizedError {
  case requestLocation(Error)
  
  var errorDescription: String? {
    switch self {
    case .requestLocation(let error):
      return "requestLocation에서 다음 에러가 발생했습니다.: \(error.localizedDescription)"
    }
  }
}
