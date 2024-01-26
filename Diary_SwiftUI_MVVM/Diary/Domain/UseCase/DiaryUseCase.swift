//
//  DiaryUseCase.swift
//  Diary
//
//  Created by Erick on 2024/01/16.
//

import Combine
import CoreLocation
import SwiftErickNetwork

struct DiaryUseCase {
  
  private var repository: DiaryRepository
  private var weatherService: WeatherService
  private var locationService: LocationService
  
  init(
    repository: DiaryRepository,
    weatherService: WeatherService,
    locationService: LocationService
  ) {
    self.repository = repository
    self.weatherService = weatherService
    self.locationService = locationService
  }
}

extension DiaryUseCase: DiaryRepository {
  
  func diarys() throws -> [Diary] {
    try repository.diarys()
  }
  
  func update(_ diary: Diary) throws {
    try repository.update(diary)
  }
  
  func delete(_ diary: Diary) throws {
    try repository.delete(diary)
  }
}

extension DiaryUseCase: WeatherService {
  
  func fetchWeatherPublisher(
    coordinate: CLLocationCoordinate2D
  ) -> AnyPublisher<Weather, NetworkError> {
    return weatherService.fetchWeatherPublisher(coordinate: coordinate)
  }
}

extension DiaryUseCase: LocationService {
  
  func requestLoactionPublisher() -> AnyPublisher<CLLocationCoordinate2D, LocationServiceError> {
    return locationService.requestLoactionPublisher()
  }
}
