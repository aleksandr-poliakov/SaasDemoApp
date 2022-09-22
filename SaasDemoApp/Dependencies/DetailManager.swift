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
    private let diffs: [Diff]
    
    enum Error: Swift.Error {
        case noDiffByThatId
    }
    
    init(timeInterval: TimeInterval, diffs: [Diff]) {
        self.timeInterval = timeInterval
        self.diffs = diffs
    }
    
    func get(id: String, completionBlock: @escaping DetailFilterManagerProtocol.Result) {
        let diffs = diffs.filter { $0.idFile == id }
        DispatchQueue.global(qos: .background).async { [timeInterval] in
            DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval, execute: {
                if let diff = diffs.first {
                    completionBlock(.success(diff))
                } else {
                    completionBlock(.failure(Error.noDiffByThatId))
                }
            })
        }
    }
}
