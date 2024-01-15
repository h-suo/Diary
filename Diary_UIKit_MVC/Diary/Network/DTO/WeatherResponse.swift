//
//  WeatherResponse.swift
//  Diary
//
//  Created by Erick on 2023/11/07.
//

struct WeatherResponse: Decodable {
  let coord: Coord
  let weather: [Weather]
}

// MARK: - Coord
struct Coord: Decodable {
  let lon: Double
  let lat: Double
}

// MARK: - Weather
struct Weather: Decodable {
  let main: String
  let icon: String
}
