//
//  NetworkManager.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 10/01/24.
//

import Foundation
import Combine

//public typealias JSON = [String: Any]
//public typealias HTTPHeaders = [String: String]
//
//public enum HTTPMethod: String {
//  case get = "GET"
//  case head = "HEAD"
//  case post = "POST"
//  case put = "PUT"
//  case delete = "DELETE"
//  case connect = "CONNECT"
//}
//
//struct NetworkModel{
//  let url: URL?
//  let method: HTTPMethod
//  let body: JSON? = nil
//}

// MARK: - NetworkManager
class NetworkManager {
  func callAPI<T: Decodable>(with model: NetworkModel) -> AnyPublisher<T, Error> {
    guard let url = model.url else {
      return Fail(error: NSError(domain: "Missing API URL", code: -10001, userInfo: nil)).eraseToAnyPublisher()
    }
    let requestHeaders: [String: String] = ["Content-Type": "application/x-www-form-urlencoded"]
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = model.method.rawValue
    urlRequest.allHTTPHeaderFields = requestHeaders
    if let body = model.body {
      urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body)
    }
    return URLSession.shared.dataTaskPublisher(for: urlRequest)
      .tryMap({ data, response in
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
          throw URLError(.badServerResponse)
        }
        return data
      })
      .decode(type: T.self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}
