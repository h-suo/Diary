//
//  MockNetworkManager.swift
//  DiaryTests
//
//  Created by Erick on 2024/01/29.
//

import Combine
import Foundation
import SwiftErickNetwork

struct MockNetworkManager: NetworkManageable {
  
  var urlSession: URLSessionProtocol = URLSession.shared
  let dummyPublisher: DummyPublisher
  
  func request<DTO: Decodable, EndPoint: NetworkConfigurable>(
    with endpoint: EndPoint,
    completion: @escaping (Result<DTO, NetworkError>) -> Void
  ) where DTO == EndPoint.Response {
    
  }
  
  func request(
    with url: URL,
    completion: @escaping (Result<Data, NetworkError>
    ) -> Void) {
    
  }
  
  func requestPublisher<DTO: Decodable, EndPoint: NetworkConfigurable>(
    with endpoint: EndPoint
  ) -> AnyPublisher<DTO, NetworkError> where DTO == EndPoint.Response {
    if let error = dummyPublisher.error {
      return Fail(error: error)
        .eraseToAnyPublisher()
    } else {
      return Just(dummyPublisher.weather as! DTO)
        .setFailureType(to: NetworkError.self)
        .eraseToAnyPublisher()
    }
  }
  
  func requestPublisher(with url: URL) -> AnyPublisher<Data, NetworkError> {
    if let error = dummyPublisher.error {
      return Fail(error: error)
        .eraseToAnyPublisher()
    } else {
      return Just(dummyPublisher.data!)
        .setFailureType(to: NetworkError.self)
        .eraseToAnyPublisher()
    }
  }
}
