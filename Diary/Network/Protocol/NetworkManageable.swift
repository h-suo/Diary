//
//  NetworkManageable.swift
//  Diary
//
//  Created by Erick on 2023/11/07.
//

import Foundation

protocol NetworkManageable {
    var urlSession: URLSessionProtocol { get }
    
    func request<DTO: Decodable, EndPoint: NetworkConfigurable>(with endpoint: EndPoint, completion: @escaping (Result<DTO, NetworkError>) -> Void) where EndPoint.Response == DTO
    func request(with url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void)
}
