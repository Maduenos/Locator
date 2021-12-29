//
//  HttpService.swift
//  Locator
//
//  Created by Mahammad on 28.12.2021.
//

import Foundation
import Combine

class HttpService {
    
    static let shared = HttpService()
        
        private init() {}
        
        private var cancellables = Set<AnyCancellable>()
        private let baseURL = "https://api.tomtom.com/search/2/poiSearch/{query}.json?key={apiKey}&radius={radius}&lat={lat}&lon={lon}&limit=100"
        
        func getData<T: Decodable>(endpoint: EndpointParameters, type: T.Type) -> Future<T, Error> {
            return Future<T, Error> { [weak self] promise in
                guard let self = self,
                      let url = URL(string: self.baseURL
                                            .replacingOccurrences(of: "{query}", with: endpoint.query)
                                            .replacingOccurrences(of: "{apiKey}", with: endpoint.apiKey)
                                            .replacingOccurrences(of: "{radius}", with: "\(endpoint.radius)")
                                            .replacingOccurrences(of: "&lat={lat}", with: endpoint.lat)
                                            .replacingOccurrences(of: "&lon={lon}", with: endpoint.lon)) else {
                    return promise(.failure(RequestError.invalidURL))
                }
                print("URL is \(url.absoluteString)")
                URLSession.shared.dataTaskPublisher(for: url)
                    .tryMap { (data, response) -> Data in
                        guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                            throw RequestError.responseError
                        }
                        return data
                    }
                    .decode(type: T.self, decoder: JSONDecoder())
                    .receive(on: RunLoop.main)
                    .sink(receiveCompletion: { (completion) in
                        print("httpResponse.statusCode")
                        if case let .failure(error) = completion {
                            promise(.failure(error))
                        }
                    }, receiveValue: { promise(.success($0)) })
                    .store(in: &self.cancellables)
            }
        }
}

enum RequestError: Error {
    case invalidURL
    case responseError
    case unknown
}
