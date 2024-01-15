//
//  NetworkManagerTests.swift
//  DiaryTests
//
//  Created by Erick on 2023/11/16.
//

import XCTest
@testable import Diary

final class NetworkManagerTests: XCTestCase {
  
  // MARK: - Setup Test
  private var networkManager: NetworkManager!
  
  // MARK: - Test Case
  func test_success_request_with_url_method() {
    // given
    let expectation = XCTestExpectation(description: "success request with url")
    var resultData: Data?
    
    networkManager = NetworkManager(urlSession: MockURLSession(response: SuccessResponse()))
    
    // when
    networkManager.request(with: URL(string: "success")!) { result in
      switch result {
      case .success(let data):
        resultData = data
        expectation.fulfill()
      case .failure(let error):
        XCTFail(error.localizedDescription)
      }
    }
    
    // then
    wait(for: [expectation], timeout: 0.5)
    XCTAssertNotNil(resultData)
  }
  
  func test_success_request_with_urlRequest_method() {
    // given
    let expectation = XCTestExpectation(description: "success request with urlRequest")
    var resultWeatherResponse: WeatherResponse?
    
    let endPoint = CurrentWeatherEndPoint(lat: "123", lon: "123")
    networkManager = NetworkManager(urlSession: MockURLSession(response: SuccessResponse()))
    
    // when
    networkManager.request(with: endPoint!) { result in
      switch result {
      case .success(let weatherResponse):
        resultWeatherResponse = weatherResponse
        expectation.fulfill()
      case .failure(let error):
        XCTFail(error.localizedDescription)
      }
    }
    
    // then
    wait(for: [expectation], timeout: 0.5)
    XCTAssertNotNil(resultWeatherResponse)
  }
  
  func test_failure_invalidURL() {
    testFailure(
      description: "Failed with dataTask Error",
      failResponse: DataTaskResponse(),
      networkError: NetworkError.dataTask(NetworkError.invalidURL)
    )
  }
  
  func test_failure_invalidResponse() {
    testFailure(
      description: "Failed with invalidResponse Error",
      failResponse: InvalidResponse(),
      networkError: NetworkError.invalidResponse
    )
  }
  
  func test_failure_statusCodeOutOfRange() {
    testFailure(
      description: "Failed with statusCodeOutOfRange Error",
      failResponse: StatusCodeOutOfRangeResponse(),
      networkError: NetworkError.statusCodeOutOfRange
    )
  }
  
  func test_failure_emptyData() {
    testFailure(
      description: "Failed with emptyData Error",
      failResponse: EmptyDataResponse(),
      networkError: NetworkError.emptyData
    )
  }
  
  private func testFailure(
    description: String,
    failResponse: Response,
    networkError: NetworkError
  ) {
    // given
    let expectation = XCTestExpectation(description: description)
    var resultError: NetworkError?
    
    let endPoint = CurrentWeatherEndPoint(lat: "123", lon: "123")
    networkManager = NetworkManager(urlSession: MockURLSession(response: failResponse))
    
    // when
    networkManager.request(with: endPoint!) { result in
      switch result {
      case .success(_):
        XCTFail()
      case .failure(let error):
        resultError = error
        expectation.fulfill()
      }
    }
    
    // then
    wait(for: [expectation], timeout: 0.5)
    XCTAssertEqual(resultError, networkError)
  }
}
