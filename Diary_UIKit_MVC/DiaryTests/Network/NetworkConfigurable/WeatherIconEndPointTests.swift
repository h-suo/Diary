//
//  WeatherIconEndPointTests.swift
//  DiaryTests
//
//  Created by Erick on 2023/11/16.
//

import XCTest
@testable import Diary

final class WeatherIconEndPointTests: XCTestCase {
  
  // MARK: - Test Case
  func test_url_method() {
    do {
      // given
      let expectation = URL(string: "https://openweathermap.org/img/wn/10d@2x.png")
      let endPoint = WeatherIconEndPoint(iconId: "10d")
      // when
      let result = try endPoint.url()
      // then
      XCTAssertEqual(result, expectation)
    } catch {
      XCTFail(error.localizedDescription)
    }
  }
}
