//
//  WeatherResponseTests.swift
//  DiaryTests
//
//  Created by Erick on 2023/11/16.
//

import XCTest
@testable import Diary

final class WeatherResponseTests: XCTestCase {
  
  // MARK: - Test Case
  func test_weatherResponse_decoding() {
    // given
    let asset = NSDataAsset.init(name: "openWeatherSample")
    // when
    let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: asset!.data)
    // then
    XCTAssertNotNil(weatherResponse)
  }
}
