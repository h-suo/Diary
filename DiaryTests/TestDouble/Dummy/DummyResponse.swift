//
//  DummyResponse.swift
//  DiaryTests
//
//  Created by Erick on 2023/11/17.
//

import UIKit
@testable import Diary

protocol Response {
  var data: Data? { get }
  var response: URLResponse? { get }
  var error: Error? { get }
}

// MARK: - Response
struct SuccessResponse: Response {
  var data: Data? = NSDataAsset.init(name: "openWeatherSample")?.data
  var response: URLResponse? = HTTPURLResponse(
    url: URL(string: "success")!,
    statusCode: 200,
    httpVersion: nil,
    headerFields: nil
  )
  var error: Error?
}

struct DataTaskResponse: Response {
  var data: Data?
  var response: URLResponse?
  var error: Error? = NetworkError.invalidURL
}

struct InvalidResponse: Response {
  var data: Data?
  var response: URLResponse?
  var error: Error?
}

struct StatusCodeOutOfRangeResponse: Response {
  var data: Data?
  var response: URLResponse? = HTTPURLResponse(
    url: URL(string: "Fail")!,
    statusCode: 404,
    httpVersion: nil,
    headerFields: nil
  )
  var error: Error?
}

struct EmptyDataResponse: Response {
  var data: Data?
  var response: URLResponse? = HTTPURLResponse(
    url: URL(string: "Fail")!,
    statusCode: 200,
    httpVersion: nil,
    headerFields: nil
  )
  var error: Error?
}
