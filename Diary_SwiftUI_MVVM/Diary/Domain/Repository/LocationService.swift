//
//  LocationService.swift
//  Diary
//
//  Created by Erick on 2024/01/26.
//

import Combine
import CoreLocation

protocol LocationService {
  func requestLoactionPublisher() -> AnyPublisher<CLLocationCoordinate2D, LocationServiceError>
}
