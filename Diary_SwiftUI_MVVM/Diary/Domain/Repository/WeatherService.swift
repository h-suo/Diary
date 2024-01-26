//
//  WeatherService.swift
//  Diary
//
//  Created by Erick on 2024/01/26.
//

import Combine
import SwiftErickNetwork

protocol WeatherService {
  func fetchWeatherPublisher() -> AnyPublisher<Weather, NetworkError>
}
