//
//  WeatherIconEndPoint.swift
//  Diary
//
//  Created by Erick on 2024/01/27.
//

import Foundation
import SwiftErickNetwork

struct WeatherIconEndPoint: NetworkConfigurable {
  
  typealias Response = Data
  
  var baseURL: String
  var path: String
  var method: HttpMethod
  var queryParameters: [URLQueryItem]?
  
  init(baseURL: String = "https://openweathermap.org",
       path: String = "/img/wn",
       method: HttpMethod = .get,
       iconId: String
  ) {
    self.baseURL = baseURL
    self.path = path + "/" + iconId + "@2x.png"
    self.method = method
    self.queryParameters = nil
  }
}
