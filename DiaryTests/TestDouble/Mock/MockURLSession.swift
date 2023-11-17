//
//  MockURLSession.swift
//  DiaryTests
//
//  Created by Erick on 2023/11/17.
//

import Foundation
@testable import Diary

final class MockURLSession: URLSessionProtocol {
    var response: Response?
    
    init(response: Response?) {
        self.response = response
    }
    
    func dataTask(with request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return MockURLSessionDataTask {
            let response = self.response
            completionHandler(response?.data, response?.response, response?.error)
        }
    }
    
    func dataTask(with url: URL, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return MockURLSessionDataTask {
            let response = self.response
            completionHandler(response?.data, response?.response, response?.error)
        }
    }
}

final class MockURLSessionDataTask: URLSessionDataTask {
    let resumeHandler: () -> Void
    
    init(resumeHandler: @escaping @Sendable () -> Void) {
        self.resumeHandler = resumeHandler
    }

    override func resume() {
        resumeHandler()
    }
}
