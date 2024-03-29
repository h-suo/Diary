//
//  CurrentWeatherEndPoint.swift
//  Diary
//
//  Created by Erick on 2024/01/26.
//

import Foundation
import SwiftErickNetwork

struct CurrentWeatherEndPoint: NetworkConfigurable {
  
  typealias Response = WeatherResponse
  
  var baseURL: String
  var path: String
  var method: HttpMethod
  var queryParameters: [URLQueryItem]?
  
  init?(baseURL: String = "https://api.openweathermap.org",
        path: String = "/data/2.5/weather",
        method: HttpMethod = .get,
        lat: String,
        lon: String
  ) {
    guard let apikey = Bundle.main.object(forInfoDictionaryKey: "OPENWEATHER_API_KEY") as? String
    else { return nil }
    
    self.baseURL = baseURL
    self.path = path
    self.method = method
    self.queryParameters = [
      URLQueryItem(name: "lat", value: lat),
      URLQueryItem(name: "lon", value: lon),
      URLQueryItem(name: "appid", value: apikey)
    ]
  }
}
