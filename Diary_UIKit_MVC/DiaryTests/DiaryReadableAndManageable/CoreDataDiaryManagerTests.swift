//
//  CoreDataDiaryManagerTests.swift
//  DiaryTests
//
//  Created by Erick on 2023/09/08.
//

import CoreData
import XCTest
@testable import Diary

final class CoreDataDiaryManagerTests: XCTestCase {
  
  // MARK: - Setup Test
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "DiaryData")
    
    let storeDescription = NSPersistentStoreDescription()
    storeDescription.type = NSInMemoryStoreType
    container.persistentStoreDescriptions = [storeDescription]
    
    container.loadPersistentStores(completionHandler: { (_, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    
    return container
  }()
  
  var sut: CoreDataDiaryManager!
  
  override func setUpWithError() throws {
    sut = CoreDataDiaryManager(persistentContainer: persistentContainer)
  }
  
  override func tearDownWithError() throws {
    sut = nil
  }
  
  // MARK: - Test Case
  func test_createDiary_method_and_DiaryEntrys_method() {
    do {
      // given
      let expectation = "test title"
      let expectation2 = "test body"
      // when
      try sut.createDiary(
        title: expectation,
        body: expectation2,
        weatherResponse: nil
      )
      
      let diaryEntrys = try sut.diaryEntrys()
      // then
      let result = diaryEntrys.first
      XCTAssertEqual(result?.title, expectation)
      XCTAssertEqual(result?.body, expectation2)
    } catch {
      XCTFail(error.localizedDescription)
    }
  }
  
  func test_updateDiary_method() {
    do {
      // given
      try sut.createDiary(
        title: "test title",
        body: "test body",
        weatherResponse: nil
      )
      
      let expectation = "update test"
      // when
      var diaryEntry = try sut.diaryEntrys().first!
      diaryEntry.title = expectation
      diaryEntry.body = expectation
      try sut.updateDiary(diaryEntry)
      // then
      let result = try sut.diaryEntrys().first
      XCTAssertEqual(result?.title, expectation)
      XCTAssertEqual(result?.body, expectation)
    } catch {
      XCTFail(error.localizedDescription)
    }
  }
  
  func test_deleteDiary_method() {
    do {
      // given
      try sut.createDiary(
        title: "test title",
        body: "test body",
        weatherResponse: nil
      )
      
      let diaryEntry = try sut.diaryEntrys().first!
      // when
      try sut.deleteDiary(diaryEntry)
      // then
      let result = try sut.diaryEntrys().isEmpty
      XCTAssertTrue(result)
    } catch {
      XCTFail(error.localizedDescription)
    }
  }
}
