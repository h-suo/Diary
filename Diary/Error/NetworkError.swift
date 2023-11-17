//
//  NetworkError.swift
//  Diary
//
//  Created by Erick on 2023/11/06.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidComponents
    case invalidResponse
    case statusCodeOutOfRange
    case emptyData
    case dataTask(Error)
    case urlRequest(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "잘못된 URL입니다."
        case .invalidComponents:
            return "URL 구성요소가 잘못되었습니다."
        case .invalidResponse:
            return "잘못된 응답입니다."
        case .statusCodeOutOfRange:
            return "state 코드가 성공 범위가 아닙니다."
        case .emptyData:
            return "데이터가 없습니다."
        case .dataTask(let error):
            return "dataTask에서 다음 에러가 발생했습니다.: \(error.localizedDescription) "
        case .urlRequest(let error):
            return "urlRequest 반환 과정에서 다음 에러가 발생했습니다.: \(error.localizedDescription)"
        }
    }
}

extension NetworkError: Equatable {
    static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidURL, .invalidURL),
            (.invalidComponents, .invalidComponents),
            (.invalidResponse, .invalidResponse),
            (.statusCodeOutOfRange, .statusCodeOutOfRange),
            (.emptyData, .emptyData):
            return true
        case let (.dataTask(error1), .dataTask(error2)),
            let (.urlRequest(error1), .urlRequest(error2)):
            return error1.localizedDescription == error2.localizedDescription
        default:
            return false
        }
    }
}
