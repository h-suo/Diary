//
//  NetworkManager.swift
//  Diary
//
//  Created by Erick on 2023/11/06.
//

import Foundation

final class NetworkManager: NetworkManageable {
    
    // MARK: - Private Property
    private let session: URLSession
    
    // MARK: - Initializer
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // MARK: - NetworkManageable Method
    func request<DTO: Decodable, EndPoint: NetworkConfigurable>(with endpoint: EndPoint, completion: @escaping (Result<DTO, NetworkError>) -> Void) where EndPoint.Response == DTO {
        do {
            let request = try endpoint.urlRequest()
            
            session.dataTask(with: request) { [weak self] data, response, error in
                self?.checkError(with: data, response, error) { result in
                    guard let self = self else {
                        return
                    }
                    
                    switch result {
                    case .success(let data):
                        completion(self.decode(data: data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            }.resume()
        } catch {
            completion(.failure(NetworkError.urlRequest(error)))
        }
    }
    
    func request(with url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        session.dataTask(with: url) { [weak self] data, response, error in
            self?.checkError(with: data, response, error, completion: { result in
                completion(result)
            })
        }.resume()
    }
    
    // MARK: - Private Method
    private func checkError(with data: Data?, _ response: URLResponse?, _ error: Error?, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        if let error = error {
            completion(.failure(NetworkError.dataTask(error)))
            return
        }
        
        guard let response = response as? HTTPURLResponse else {
            completion(.failure(NetworkError.invalidResponse))
            return
        }
        
        guard (200...299).contains(response.statusCode) else {
            completion(.failure(NetworkError.statusCodeOutOfRange))
            return
        }
        
        guard let data = data else {
            completion(.failure(NetworkError.emptyData))
            return
        }
        
        completion(.success((data)))
    }
    
    private func decode<DTO: Decodable>(data: Data) -> Result<DTO, NetworkError> {
        do {
            let decoded = try JSONDecoder().decode(DTO.self, from: data)
            return .success(decoded)
        } catch {
            return .failure(NetworkError.emptyData)
        }
    }
}
