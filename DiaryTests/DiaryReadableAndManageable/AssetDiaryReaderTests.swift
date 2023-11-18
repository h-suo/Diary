//
//  AssetDiaryReaderTests.swift
//  DiaryTests
//
//  Created by Erick on 2023/08/30.
//

import XCTest
@testable import Diary

final class AssetDiaryReaderTests: XCTestCase {
  
  // MARK: - Setup Test
  var sut: AssetDiaryReader?
  
  override func setUpWithError() throws {
    sut = AssetDiaryReader()
  }
  
  override func tearDownWithError() throws {
    sut = nil
  }
  
  // MARK: - Test Case
  func test_DiaryEntrys_method() {
    do {
      // when
      let result = try sut?.diaryEntrys() is [DiaryEntry]
      // then
      XCTAssertTrue(result)
    } catch {
      XCTFail(error.localizedDescription)
    }
  }
}
