//
//  WeatherIconEndPoint.swift
//  Diary
//
//  Created by Erick on 2023/11/10.
//

import Foundation

struct WeatherIconEndPoint: NetworkConfigurable {
    
    // MARK: - DTO Type
    typealias Response = Data
    
    // MARK: - Property
    var baseURL: String
    var path: String
    var method: HttpMethod
    var queryParameters: [URLQueryItem]?
    
    // MARK: - Initializer
    init(baseURL: String = "https://openweathermap.org",
         path: String = "img/wn",
         method: HttpMethod = .get,
         iconId: String
    ) {
        self.baseURL = baseURL
        self.path = path + "/" + iconId + "@2x.png"
        self.method = method
        self.queryParameters = nil
    }
}
