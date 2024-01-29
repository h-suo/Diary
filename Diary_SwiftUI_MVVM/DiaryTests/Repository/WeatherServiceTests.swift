//
//  WeatherServiceTests.swift
//  DiaryTests
//
//  Created by Erick on 2024/01/29.
//

import CoreLocation
import SwiftErickNetwork
import XCTest
@testable import Diary

final class WeatherServiceTests: XCTestCase {
  
  var sut: WeatherService!
  
  override func tearDownWithError() throws {
    sut = nil
  }
  
  func test_success_fetchWeatherPublisher() {
    // given
    let expectation = XCTestExpectation(description: "success fetch Weather")
    var result: Weather?
    
    sut = WeatherNetworkService(
      networkManager: MockNetworkManager(
        dummyPublisher: SuccessPublisher()
      )
    )
    
    // when
    let _ = sut
      .fetchWeatherPublisher(location: CLLocationCoordinate2D())
      .sink { completion in
        if case .failure(let error) = completion {
          XCTFail(error.localizedDescription)
        }
      } receiveValue: { weather in
        // then
        result = weather
        expectation.fulfill()
      }
    
    // then
    wait(for: [expectation], timeout: 0.5)
    XCTAssertNotNil(result)
  }
  
  func test_success_fetchWeatherIconPublisher() {
    let expectation = XCTestExpectation(description: "success fetch WeatherIcon")
    var result: Data?
    
    sut = WeatherNetworkService(
      networkManager: MockNetworkManager(
        dummyPublisher: SuccessPublisher()
      )
    )
    
    // when
    let _ = sut
      .fetchWeatherIconPublisher(weatherID: "success")
      .sink { completion in
        if case .failure(let error) = completion {
          XCTFail(error.localizedDescription)
        }
      } receiveValue: { data in
        // then
        result = data
        expectation.fulfill()
      }
    
    // then
    wait(for: [expectation], timeout: 0.5)
    XCTAssertNotNil(result)
  }
  
  func test_failure_fetchWeatherPublisher_with_emptyData() {
    // given
    let expectation = XCTestExpectation(description: "Failed with emptyData Error")
    var result: NetworkError?
    
    sut = WeatherNetworkService(
      networkManager: MockNetworkManager(
        dummyPublisher: EmptyDataPublisher()
      )
    )
    
    // when
    let _ = sut.fetchWeatherPublisher(location: CLLocationCoordinate2D())
      .sink { completion in
        switch completion {
        case .finished:
          XCTFail("Failed test failed.")
        case .failure(let error):
          result = error
          expectation.fulfill()
        }
      } receiveValue: { _ in
        XCTFail("Failed test failed.")
      }
    
    // then
    wait(for: [expectation], timeout: 0.5)
    XCTAssertEqual(result, NetworkError.emptyData)
  }
  
  func test_failure_fetchWeatherIconPublisher_with_emptyData() {
    // given
    let expectation = XCTestExpectation(description: "Failed with emptyData Error")
    var result: NetworkError?
    
    sut = WeatherNetworkService(
      networkManager: MockNetworkManager(
        dummyPublisher: EmptyDataPublisher2()
      )
    )
    
    // when
    let _ = sut.fetchWeatherPublisher(location: CLLocationCoordinate2D())
      .sink { completion in
        switch completion {
        case .finished:
          XCTFail("Failed test failed.")
        case .failure(let error):
          result = error
          expectation.fulfill()
        }
      } receiveValue: { _ in
        XCTFail("Failed test failed.")
      }
    
    // then
    wait(for: [expectation], timeout: 0.5)
    XCTAssertEqual(result, NetworkError.emptyData)
  }
}
