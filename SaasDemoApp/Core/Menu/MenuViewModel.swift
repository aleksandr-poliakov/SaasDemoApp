//
//  MenuViewModel.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 20.09.2022.
//

import Foundation

final class MenuViewModel {
    private var networkManager: HTTPManagerProtocol?
    private var authors: [Commit] = []
    typealias Observer<T> = (T) -> Void
    
    var dataIsLoaded: Observer<Bool>?
    
    init(networkManager: HTTPManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchData() {
        networkManager?.get(completionBlock: { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case .success(let data):
                self?.authors = DataMapper.mapArrayValues(data: data)
                self?.dataIsLoaded?(true)
            case .failure:
                self?.dataIsLoaded?(false)
            }
        })
    }
    
    func numberOfItems() -> Int {
        authors.count
    }
    
    func indexPerItem(index: Int) -> Commit {
        authors[index]
    }
}
