//
//  WeatherService.swift
//  Diary
//
//  Created by Erick on 2024/01/26.
//

import Combine
import CoreLocation
import SwiftErickNetwork

protocol WeatherService {
  func fetchWeatherPublisher(
    coordinate: CLLocationCoordinate2D
  ) -> AnyPublisher<Weather, NetworkError>
}
