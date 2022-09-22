//
//  HTTPManager.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 20.09.2022.
//

import Foundation

protocol HTTPManagerProtocol {
    typealias Result = (Swift.Result<Data, Error>) -> Void
    
    func get(completionBlock: @escaping Result)
}

final class HTTPManager: HTTPManagerProtocol {
    private let timeInterval: TimeInterval
    private let mock: MockData
    
    enum Error: Swift.Error {
        case thereIsNoData
    }
    
    init(timeInterval: TimeInterval, mock: MockData) {
        self.timeInterval = timeInterval
        self.mock = mock
    }
    
    func get(completionBlock: @escaping HTTPManagerProtocol.Result) {
        DispatchQueue.global(qos: .background).async { [timeInterval] in
            DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval, execute: { [weak self] in
                guard self != nil else { return }
                
                if let data = self?.mock.data {
                    completionBlock(.success(data))
                } else {
                    completionBlock(.failure(Error.thereIsNoData))
                }
            })
        }
    }
}
