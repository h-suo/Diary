//
//  NetworkManagerTests.swift
//  DiaryTests
//
//  Created by Erick on 2023/11/16.
//

import XCTest
@testable import Diary

final class NetworkManagerTests: XCTestCase {
    
    // MARK: - Setup Test
    private var networkManager: NetworkManager!
    
    // MARK: - Test Case
    func test_NetworkManager의_request_with_url이_성공한다면_알맞는_Data를_반환합니다() {
        // given
        let expectation = XCTestExpectation(description: "success request with url")
        var resultData: Data?
        
        networkManager = NetworkManager(urlSession: MockURLSession(response: SuccessResponse()))
        
        // when
        networkManager.request(with: URL(string: "success")!) { result in
            switch result {
            case .success(let data):
                resultData = data
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        // then
        wait(for: [expectation], timeout: 0.5)
        XCTAssertNotNil(resultData)
    }
    
    func test_NetworkManager의_request_with_EndPoint가_성공한다면_EndPoint_response에_맞는_DTO를_반환합니다() {
        // given
        let expectation = XCTestExpectation(description: "success request with urlRequest")
        var resultWeatherResponse: WeatherResponse?
        
        let endPoint = CurrentWeatherEndPoint(lat: "123", lon: "123")
        networkManager = NetworkManager(urlSession: MockURLSession(response: SuccessResponse()))
        
        // when
        networkManager.request(with: endPoint!) { result in
            switch result {
            case .success(let weatherResponse):
                resultWeatherResponse = weatherResponse
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        // then
        wait(for: [expectation], timeout: 0.5)
        XCTAssertNotNil(resultWeatherResponse)
    }
    
    func test_NetworkManager의_request_과정에서_urlSession이_Error를_반환한다면_NetworkManager가_invalidURL_에러를_반환합니다() {
        failureCase(description: "Failed with dataTask Error", failResponse: DataTaskResponse(), networkError: NetworkError.dataTask(NetworkError.invalidURL))
    }
    
    func test_NetworkManager의_request_과정에서_urlSession이_잘못된_response를_반환한다면_NetworkManager가_invalidResponse_에러를_반환합니다() {
        failureCase(description: "Failed with invalidResponse Error", failResponse: InvalidResponse(), networkError: NetworkError.invalidResponse)
    }
    
    func test_NetworkManager의_request_과정에서_urlSession이_반환한_response의_상태코드가_성공이_아니라면_NetworkManager가_statusCodeOutOfRange_에러를_반환합니다() {
        failureCase(description: "Failed with statusCodeOutOfRange Error", failResponse: StatusCodeOutOfRangeResponse(), networkError: NetworkError.statusCodeOutOfRange)
    }
    
    func test_NetworkManager의_request_과정에서_urlSession이_데이터를_반환하지_않는다면_NetworkManager가_emptyData_에러를_반환합니다() {
        failureCase(description: "Failed with emptyData Error", failResponse: EmptyDataResponse(), networkError: NetworkError.emptyData)
    }
    
    private func failureCase(description: String, failResponse: Response, networkError: NetworkError) {
        // given
        let expectation = XCTestExpectation(description: description)
        var resultError: NetworkError?
        
        let endPoint = CurrentWeatherEndPoint(lat: "123", lon: "123")
        networkManager = NetworkManager(urlSession: MockURLSession(response: failResponse))
        
        // when
        networkManager.request(with: endPoint!) { result in
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                resultError = error
                expectation.fulfill()
            }
        }
        
        // then
        wait(for: [expectation], timeout: 0.5)
        XCTAssertEqual(resultError, networkError)
    }
}
