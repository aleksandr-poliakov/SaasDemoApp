//
//  DetailViewModel.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 20.09.2022.
//

import Foundation

final class DetailViewModel {
    private var networkManager: HTTPManagerProtocol?
    private var entries: [ChangesetEntry] = []
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
                self?.entries = DataMapper.mapArrayValues(data: data)
                self?.dataIsLoaded?(true)
            case .failure:
                self?.dataIsLoaded?(false)
            }
        })
    }
    
    var numberOfSections: Int {
        entries.count
    }
    
    func numberOfItems(index: Int) -> Int {
        if entries[index].isExpand == false {
            return 0
        } else {
            return 1
        }
    }
    
    @discardableResult
    func indexPerSection(index: Int) -> ChangesetEntry {
        entries[index]
    }
    
    func indexPerRow(indexPath: IndexPath) -> String {
        entries[indexPath.section].diff.content
    }
    
    func expandOrCollapseEntry(index: Int) {
        entries[index].isExpand.toggle()
    }
}
