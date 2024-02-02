//
//  ApiService.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 02/02/24.
//

import Foundation
import Combine


// MARK: - Type Aliases
public typealias JSON = [String: Any]
public typealias HTTPHeaders = [String: String]

// MARK: - Enum

public enum HTTPMethod: String {
  case get = "GET"
  case head = "HEAD"
  case post = "POST"
  case put = "PUT"
  case delete = "DELETE"
  case connect = "CONNECT"
}

// MARK: - Struct

struct NetworkModel {
  let url: URL?
  let method: HTTPMethod
  let body: JSON?
  
  init(url: URL?,
       method: HTTPMethod,
       body: JSON? = nil
  ) {
    self.url = url
    self.method = method
    self.body = body
  }
}


protocol ApiService: AnyObject {
  func fetch<T: Decodable>(with model: NetworkModel) -> AnyPublisher<T, Error>
}

class ApiServiceImpl: ApiService {
  func fetch<T>(with model: NetworkModel) -> AnyPublisher<T, Error> where T : Decodable {
    guard let url = model.url else {
      return createErrorPublisher(message: "Missing API URL", code: -10001)
    }
    
    let requestHeaders: [String: String] = ["Content-Type": "application/x-www-form-urlencoded"]
    let urlRequest = createURLRequest(url: url, method: model.method, headers: requestHeaders, body: model.body)
    
    return URLSession.shared.dataTaskPublisher(for: urlRequest)
      .tryMap(validateResponse)
      .decode(type: T.self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
  
  private func createErrorPublisher<T>(message: String, code: Int) -> AnyPublisher<T, Error> {
    return Fail(error: NSError(domain: message, code: code, userInfo: nil)).eraseToAnyPublisher()
  }
  
  private func createURLRequest(url: URL, method: HTTPMethod, headers: [String: String], body: [String: Any]?) -> URLRequest {
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = method.rawValue
    urlRequest.allHTTPHeaderFields = headers
    
    if let body = body {
      urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body)
    }
    
    return urlRequest
  }
  
  private func validateResponse(data: Data, response: URLResponse) throws -> Data {
    guard let httpResponse = response as? HTTPURLResponse else {
      throw URLError(.badServerResponse)
    }
    
    guard (200..<300).contains(httpResponse.statusCode) else {
      throw URLError(.badServerResponse)
    }
    
    return data
  }
  
  
}
