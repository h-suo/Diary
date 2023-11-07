//
//  CurrentWeatherEndPoint.swift
//  Diary
//
//  Created by Erick on 2023/11/06.
//

import Foundation

struct CurrentWeatherEndPoint: NetworkConfigurable {
    // MARK: - Property
    var baseURL: String
    var path: String
    var method: HttpMethod
    var queryParameters: [String: String]?
    
    // MARK: - Initializer
    init?(baseURL: String = "https://api.openweathermap.org",
          path: String = "data/2.5/weather",
          method: HttpMethod = .get,
          lat: String,
          lon: String
    ) {
        guard let apikey = Bundle.main.object(forInfoDictionaryKey: "") as? String else {
            return nil
        }
        
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.queryParameters = [
            "lat": lat,
            "lon": lon,
            "appid": apikey
        ]
    }
}
