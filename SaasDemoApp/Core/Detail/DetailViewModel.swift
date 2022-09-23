//
//  DetailViewModel.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 20.09.2022.
//

import Foundation

final class DetailViewModel {
    private var networkManager: DetailFilterManagerProtocol
    private var entries: [ChangesetEntry] = []
    typealias Observer<T> = (T) -> Void
    
    var dataIsLoaded: Observer<Int>?
    
    init(author: Author, networkManager: DetailFilterManagerProtocol) {
        self.entries = author.entries
        self.networkManager = networkManager
    }
    
    func fetchData(index: Int, id: String) {
        if entries[index].diff != nil {
            dataIsLoaded?(index)
            return
        }
        
        networkManager.get(id: id, completionBlock: { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case .success(let data):
                self?.entries[index].diff = data
                self?.dataIsLoaded?(index)
            case .failure:
                self?.dataIsLoaded?(index)
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
    
    func indexPerRow(indexPath: IndexPath) -> String? {
        entries[indexPath.section].diff?.content
    }
    
    func expandOrCollapseEntry(index: Int) {
        entries[index].isExpand.toggle()
    }
    
    func getFileId(index: Int) -> String {
        entries[index].fileName
    }
}
