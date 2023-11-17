//
//  CurrentWeatherEndPointTests.swift
//  DiaryTests
//
//  Created by Erick on 2023/11/16.
//

import XCTest
@testable import Diary

final class CurrentWeatherEndPointTests: XCTestCase {

    // MARK: - Test Case
    func test_CurrentWeatherEndPoint의_url을_호출하면_CurrentWeatherAPI_URL을_반환합니다() {
        do {
            // given
            guard let apikey = Bundle.main.object(forInfoDictionaryKey: "OPENWEATHER_API_KEY") as? String else {
                return XCTFail("API Key를 불러오지 못 했습니다.")
            }
            let expectation = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=testLat&lon=testLon&appid=\(apikey)")
            let endPoint = CurrentWeatherEndPoint(lat: "testLat", lon: "testLon")
            // when
            let result = try endPoint?.url()
            // then
            XCTAssertEqual(result, expectation)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func test_CurrentWeatherEndPoint의_urlRequest을_호출하면_CurrentWeatherAPI_URLRequest을_반환합니다() {
        do {
            // given
            guard let apikey = Bundle.main.object(forInfoDictionaryKey: "OPENWEATHER_API_KEY") as? String else {
                return XCTFail("API Key를 불러오지 못 했습니다.")
            }
            let expectationURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=testLat&lon=testLon&appid=\(apikey)")
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
