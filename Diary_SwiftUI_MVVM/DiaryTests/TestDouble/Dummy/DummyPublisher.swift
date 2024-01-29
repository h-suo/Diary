//
//  DummyPublisher.swift
//  DiaryTests
//
//  Created by Erick on 2024/01/29.
//

import Foundation
import SwiftErickNetwork
@testable import Diary

protocol DummyPublisher {
  var weather: WeatherResponse? { get }
  var data: Data? { get }
  var error: NetworkError? { get }
}

struct SuccessPublisher: DummyPublisher {
  var weather: WeatherResponse? = WeatherResponse(
    coord: Coord(lon: 0, lat: 0),
    weather: [Weather(main: "main", icon: "icon")]
  )
  var data: Data? = "success".data(using: .utf8)
  var error: SwiftErickNetwork.NetworkError?
}

struct EmptyDataPublisher: DummyPublisher {
  var weather: WeatherResponse? = WeatherResponse(
    coord: Coord(lon: 0, lat: 0),
    weather: []
  )
  var data: Data?
  var error: SwiftErickNetwork.NetworkError?
}

struct EmptyDataPublisher2: DummyPublisher {
  var weather: WeatherResponse?
  var data: Data?
  var error: SwiftErickNetwork.NetworkError? = .emptyData
}
