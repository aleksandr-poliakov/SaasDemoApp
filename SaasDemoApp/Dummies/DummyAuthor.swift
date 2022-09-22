//
//  DummyAuthor.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 22.09.2022.
//

import Foundation

struct DummyAuthor: Author {
    let name: String
    let commitHash: String
    let email: String
    let subject: String
    let date: Date
    let timeInterval: Double
    let entries: [ChangesetEntry]
    
    init() {
        name = ""
        commitHash = ""
        email = ""
        subject = ""
        date = Date()
        timeInterval = 0.0
        entries = []
    }
}
