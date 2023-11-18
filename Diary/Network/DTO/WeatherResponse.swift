//
//  WeatherResponse.swift
//  Diary
//
//  Created by Erick on 2023/11/07.
//

struct WeatherResponse: Codable {
  let coord: Coord
  let weather: [Weather]
}

// MARK: - Coord
struct Coord: Codable {
  let lon: Double
  let lat: Double
}

// MARK: - Weather
struct Weather: Codable {
  let main: String
  let icon: String
}
