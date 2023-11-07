//
//  NetworkConfigurable.swift
//  Diary
//
//  Created by Erick on 2023/11/06.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol NetworkConfigurable {
    associatedtype Response
    
    var baseURL: String { get }
    var path: String { get }
    var method: HttpMethod { get }
    var queryParameters: [String: String]? { get }
}

extension NetworkConfigurable {
    func urlRequest() throws -> URLRequest {
        let url = try url()
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
    func url() throws -> URL {
        let fullPath = "\(baseURL)/\(path)"
        
        guard var urlComponents = URLComponents(string: fullPath) else {
            throw NetworkError.invalidURL
        }
        
        var queryItems = [URLQueryItem]()
        
        queryParameters?.forEach {
            queryItems.append(URLQueryItem(name: $0.key, value: $0.value))
        }
        
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            throw NetworkError.invalidComponents
        }
        
        return url
    }
}
