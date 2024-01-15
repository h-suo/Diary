//
//  DiaryTests.swift
//  DiaryTests
//
//  Created by Erick on 2023/08/29.
//

import XCTest
@testable import Diary

final class DiaryTests: XCTestCase {
  
  // MARK: - Test Case
  func test_Diary_decoding() {
    // given
    let asset = NSDataAsset.init(name: "sample")
    // when
    let diarys = try? JSONDecoder().decode([Diary].self, from: asset!.data)
    // then
    XCTAssertNotNil(diarys)
  }
  
  func test_diaryEntry_method() {
    // given
    guard let asset = NSDataAsset.init(name: "sample"),
          let diarys = try? JSONDecoder().decode([Diary].self, from: asset.data) else {
      return XCTFail("asset의 데이터를 불러오지 못했거나, Diary로 디코딩하지 못 했습니다.")
    }
    // when
    let result = diarys.map {
      $0.diaryEntry()
    } is [DiaryEntry]
    // then
    XCTAssertTrue(result)
  }
}
