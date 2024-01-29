//
//  LocationManagerService.swift
//  Diary
//
//  Created by Erick on 2024/01/26.
//

import Combine
import CoreLocation

final class LocationManagerService: NSObject, CLLocationManagerDelegate, LocationService {
  
  private var locationManager: CLLocationManager
  private var locationSubject = PassthroughSubject<CLLocationCoordinate2D, LocationServiceError>()
  
  init(locationManager: CLLocationManager = CLLocationManager()) {
    self.locationManager = locationManager
    super.init()
    
    self.locationManager.delegate = self
    self.locationManager.requestWhenInUseAuthorization()
  }
  
  func requestLoactionPublisher() -> AnyPublisher<CLLocationCoordinate2D, LocationServiceError> {
    locationManager.requestLocation()
    return locationSubject.eraseToAnyPublisher()
  }
  
  func locationManager(
    _ manager: CLLocationManager,
    didUpdateLocations locations: [CLLocation]
  ) {
    guard let location = locations.last?.coordinate
    else { return }
    
    locationSubject.send(location)
    locationManager.stopUpdatingLocation()
  }
  
  func locationManager(
    _ manager: CLLocationManager,
    didFailWithError error: Error
  ) {
    locationSubject.send(completion: .failure(LocationServiceError.requestLocation(error)))
  }
}
