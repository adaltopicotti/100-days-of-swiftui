//
//  Friend.swift
//  ConsolidationV
//
//  Created by Adalto Picotti Junior on 09/03/23.
//

import Foundation

struct Friend: Codable, Identifiable {
    let id: UUID
    let name: String
}

extension Friend {
    init(cached: Friend) {
        self.id = cached.id
        self.name = cached.name
       
    }
}
