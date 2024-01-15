//
//  CurrentWeatherEndPointTests.swift
//  DiaryTests
//
//  Created by Erick on 2023/11/16.
//

import XCTest
@testable import Diary

final class CurrentWeatherEndPointTests: XCTestCase {
  
  let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=testLat&lon=testLon&appid="
  
  // MARK: - Test Case
  func test_url_method() {
    do {
      // given
      guard let apikey = Bundle.main.object(
        forInfoDictionaryKey: "OPENWEATHER_API_KEY"
      ) as? String else {
        return XCTFail("API Key를 불러오지 못 했습니다.")
      }
      let expectation = URL(string: urlString + apikey)
      let endPoint = CurrentWeatherEndPoint(lat: "testLat", lon: "testLon")
      // when
      let result = try endPoint?.url()
      // then
      XCTAssertEqual(result, expectation)
    } catch {
      XCTFail(error.localizedDescription)
    }
  }
  
  func test_urlRequest_method() {
    do {
      // given
      guard let apikey = Bundle.main.object(
        forInfoDictionaryKey: "OPENWEATHER_API_KEY"
      ) as? String else {
        return XCTFail("API Key를 불러오지 못 했습니다.")
      }
      let expectationURL = URL(string: urlString + apikey)
      var expectation = URLRequest(url: expectationURL!)
      expectation.httpMethod = HttpMethod.get.rawValue
      let endPoint = CurrentWeatherEndPoint(lat: "testLat", lon: "testLon")
      // when
      let result = try endPoint?.urlRequest()
      // then
      XCTAssertEqual(result, expectation)
    } catch {
      XCTFail(error.localizedDescription)
    }
  }
}
