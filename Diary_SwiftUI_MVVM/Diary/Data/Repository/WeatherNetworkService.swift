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
  
  private let networkManager: NetworkManager
  
  init(networkManager: NetworkManager = NetworkManager()) {
    self.networkManager = networkManager
  }
  
  func fetchWeatherPublisher(
    location: CLLocationCoordinate2D
  ) -> AnyPublisher<Weather, NetworkError> {
    guard let endPoint = CurrentWeatherEndPoint(lat: String(location.latitude),
                                                lon: String(location.latitude))
    else { return Fail(error: NetworkError.invalidComponents).eraseToAnyPublisher() }
    
    return networkManager
      .requestPublisher(with: endPoint)
      .tryMap { weatherResponse in
        guard let weather = weatherResponse.weather.first
        else { throw NetworkError.emptyData }
        
        return weather
      }
      .mapError { error in
        if let networkError = error as? NetworkError {
          return networkError
        } else {
          return NetworkError.dataTask(error)
        }
      }
      .eraseToAnyPublisher()
  }
  
  func fetchWeatherIconPublisher(weatherID: String) -> AnyPublisher<Data, NetworkError> {
    guard let url = try? WeatherIconEndPoint(iconId: weatherID).url()
    else { return Fail(error: NetworkError.invalidComponents).eraseToAnyPublisher() }
            
    return networkManager
      .requestPublisher(with: url)
  }
}
