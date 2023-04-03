//
//  User.swift
//  ConsolidationV
//
//  Created by Adalto Picotti Junior on 09/03/23.
//

import Foundation

struct User: Codable, Identifiable {
    
    let id: UUID
    let name: String
    let age: Int
    let company: String
    let isActive: Bool
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}

extension User {
    init(cached: User) {
        self.id = cached.id
        self.name = cached.name
        self.age = cached.age
        self.company = cached.company
        self.isActive = cached.isActive
        self.email = cached.email
        self.address = cached.address
        self.about = cached.about
        self.registered = cached.registered
        self.tags = cached.tags
        self.friends = [Friend(id: UUID(), name: "")]
    }
}
