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
    func test_openWeatherSample_Asset_data를_디코딩할_때_weatherResponse와_매칭_시킬_수_있습니다() {
        // given
        let asset = NSDataAsset.init(name: "openWeatherSample")
        // when
        let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: asset!.data)
        // then
        XCTAssertNotNil(weatherResponse)
    }
}
