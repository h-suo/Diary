//
//  WeatherNetworkService.swift
//  Diary
//
//  Created by Erick on 2024/01/26.
//

import Combine
import CoreLocation
import SwiftErickNetwork

struct WeatherNetworkService: WeatherService {
  
  func fetchWeatherPublisher(
    coordinate: CLLocationCoordinate2D
  ) -> AnyPublisher<Weather, NetworkError> {
    guard let endPoint = CurrentWeatherEndPoint(lat: String(coordinate.latitude),
                                                lon: String(coordinate.latitude))
    else { return Fail(error: NetworkError.invalidComponents).eraseToAnyPublisher() }
    
    return NetworkManager()
      .requestPublisher(with: endPoint)
      .map { $0.weather.first ?? Weather(main: "", icon: "") }
      .eraseToAnyPublisher()
  }
}
