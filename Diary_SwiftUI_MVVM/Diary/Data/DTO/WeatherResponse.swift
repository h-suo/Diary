//
//  WeatherResponse.swift
//  Diary
//
//  Created by Erick on 2024/01/26.
//

import Foundation

struct WeatherResponse: Decodable {
  let coord: Coord
  let weather: [Weather]
}

struct Coord: Decodable {
  let lon: Double
  let lat: Double
}

struct Weather: Decodable {
  let main: String
  let icon: String
}
