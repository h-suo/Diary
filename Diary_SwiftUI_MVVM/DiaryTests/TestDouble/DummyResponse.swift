//
//  DummyResponse.swift
//  DiaryTests
//
//  Created by Erick on 2024/01/29.
//

import Foundation
import SwiftErickNetwork
@testable import Diary

//protocol DummyResponse {
//  var weather: WeatherResponse { get }
//  var data: Data { get }
//  var error: NetworkError { get }
//}
//
//struct SuccessCombineResponse: DummyResponse {
//  var weather: WeatherResponse = WeatherResponse(
//    coord: Coord(lon: 0, lat: 0),
//    weather: [Weather(main: "main", icon: "icon")]
//  )
//  var data: Data = """
//                   """.data(using: .utf8)!
//  var error: NetworkError = nil
//}
//
//struct InvalidCombineResponse: DummyResponse {
//  var data: Data = """
//                     """.data(using: .utf8)!
//  var response: URLResponse = URLResponse(url: URL(string: "Fail")!,
//                                          mimeType: nil,
//                                          expectedContentLength: 404,
//                                          textEncodingName: nil)
//}
//
//struct StatusCodeOutOfRangeCombineResponse: DummyResponse {
//  var data: Data = """
//                     """.data(using: .utf8)!
//  var response: URLResponse = HTTPURLResponse(url: URL(string: "Fail")!,
//                                              statusCode: 404,
//                                              httpVersion: "HTTP/1.1",
//                                              headerFields: nil)!
//}


