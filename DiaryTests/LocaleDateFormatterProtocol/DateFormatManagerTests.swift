//
//  DateFormatManagerTests.swift
//  DiaryTests
//
//  Created by Erick on 2023/08/30.
//

import XCTest
@testable import Diary

final class DateFormatManagerTests: XCTestCase {
  
  // MARK: - Test Case
  func test_string_method() {
    // given
    let userDateFormatter = UserDateFormatter.shared
    let expectation = "2020년 12월 23일"
    // when
    let result = DateFormatManager.string(
      localeDateFormatter: userDateFormatter,
      timestamp: 1608651333
    )
    // then
    XCTAssertEqual(result, expectation)
  }
}
