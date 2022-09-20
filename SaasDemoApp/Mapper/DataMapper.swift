//
//  Mapper.swift
//  SaasDemoApp
//
//  Created by Aleksandr on 20.09.2022.
//

import Foundation

enum DataMapper {
    static func mapArrayValues<T: Codable>(data: Data) -> [T] {
        let decoder = DecodeHelper.decoder()
        
        guard let root = try? decoder.decode([T].self, from: data) else {
            return []
        }
        
        return root
    }
}
