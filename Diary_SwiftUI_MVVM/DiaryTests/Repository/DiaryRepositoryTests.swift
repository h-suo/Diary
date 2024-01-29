//
//  DiaryRepositoryTests.swift
//  DiaryTests
//
//  Created by Erick on 2024/01/29.
//

import CoreData
import XCTest
@testable import Diary

final class DiaryRepositoryTests: XCTestCase {
  
  var sut: DiaryRepository!
  
  override func setUpWithError() throws {
    sut = DiaryCoreDataRepository(
      persistentContainer: PersistenceController.init(inMemory: true).container
    )
  }
  
  override func tearDownWithError() throws {
    sut = nil
  }
  
  func test_update_and_diarys() {
    do {
      // given
      let exampleDiary1 = Diary(title: "test1", contents: "test1")
      let exampleDiary2 = Diary(title: "test2", contents: "test2")
      var result: [Diary] = []

      // when
      try sut.update(exampleDiary1)
      try sut.update(exampleDiary2)
      result = try sut.diarys()
      
      // then
      XCTAssertEqual(result, [exampleDiary1, exampleDiary2])
    } catch {
      XCTFail(error.localizedDescription)
    }
  }
  
  func test_delete() {
    do {
      // given
      let exampleDiary1 = Diary(title: "test1", contents: "test1")
      let exampleDiary2 = Diary(title: "test2", contents: "test2")
      var result: [Diary] = []
      
      try sut.update(exampleDiary1)
      try sut.update(exampleDiary2)

      // when
      try sut.delete(exampleDiary2)
      result = try sut.diarys()
      
      // then
      XCTAssertEqual(result, [exampleDiary1])
    } catch {
      XCTFail(error.localizedDescription)
    }
  }
}
