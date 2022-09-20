//
//  Author.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 20.09.2022.
//

import Foundation

struct Commit: Codable {
    let name: String
    let commitHash: String
    let email: String
    let subject: String
    let date: Date
}

struct ChangesetEntry: Codable {
    let status: EntryStatus
    let fileName: String
    let diff: Diff
    
    var isExpand: Bool = false
    
    enum EntryStatus: String, Codable {
        case Deleted, Modified, Added
    }
}

struct Diff: Codable {
    let content: String
}
