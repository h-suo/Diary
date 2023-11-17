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
    func test_WeatherIconEndPoint의_url을_호출하면_WeatherConditionAPI_URL을_반환합니다() {
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
