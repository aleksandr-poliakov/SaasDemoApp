//
//  DetailManager.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 22.09.2022.
//

import Foundation

protocol DetailFilterManagerProtocol {
    typealias Result = (Swift.Result<Diff, Error>) -> Void
    
    func get(id: String, completionBlock: @escaping Result)
}

final class DetailManager: DetailFilterManagerProtocol {
    private let timeInterval: TimeInterval
    private let mock: MockData
    
    enum Error: Swift.Error {
        case noDiffByThatId
    }
    
    init(timeInterval: TimeInterval, mock: MockData) {
        self.timeInterval = timeInterval
        self.mock = mock
    }
    
    func get(id: String, completionBlock: @escaping DetailFilterManagerProtocol.Result) {
        DispatchQueue.global(qos: .background).async { [timeInterval, mock] in
            let diffs: [Diff] = DataMapper.mapArrayValues(data: mock.data)
            let filteredDiffs = diffs.filter { $0.idFile == id }
            DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval, execute: {
                if let diff = filteredDiffs.first {
                    completionBlock(.success(diff))
                } else {
                    completionBlock(.failure(Error.noDiffByThatId))
                }
            })
        }
    }
}
