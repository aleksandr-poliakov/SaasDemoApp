//
//  Author.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 20.09.2022.
//

import Foundation

protocol Author: Codable {
    var name: String { get }
    var commitHash: String { get }
    var email: String { get }
    var subject: String { get }
    var date: Date { get }
    var timeInterval: Double { get }
    var entries: [ChangesetEntry] { get }
}

struct Commit: Author {
    var name: String
    var commitHash: String
    var email: String
    var subject: String
    var date: Date
    var timeInterval: Double
    var entries: [ChangesetEntry]
}

struct ChangesetEntry: Codable {
    let status: EntryStatus
    let fileName: String
    var diff: Diff
    
    var isExpand: Bool = false
    
    enum EntryStatus: String, Codable {
        case Deleted, Modified, Added
    }
}

struct Diff: Codable {
    let idFile: String
    let content: String
}
