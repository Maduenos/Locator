//
//  DataRequester.swift
//  Locator
//
//  Created by Mahammad on 29.12.2021.
//

import Foundation
import Combine

class DataRequester {
    
    var dataReceived = PassthroughSubject<SearchItem, Never>()
    var cancellables = Set<AnyCancellable>()
    
    init () {}
    
    func initSearch (endpointParameters: EndpointParameters) {
        HttpService.shared.getData(endpoint: endpointParameters, type: SearchItem.self)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error occured: \(error.localizedDescription)")
                case .finished :
                    print("Done")
                }
            } receiveValue: { [weak self] data in
                self?.dataReceived.send(data)
            }
            .store(in: &cancellables)
    }
    
}
