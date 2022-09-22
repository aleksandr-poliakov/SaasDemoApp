//
//  DummyMock.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 22.09.2022.
//

import Foundation


struct DummyMock: MockData {
    var data: Data
    
    init() {
        data = Data()
    }
}
