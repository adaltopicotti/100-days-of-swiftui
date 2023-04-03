//
//  Activity.swift
//  HabitTracker
//
//  Created by Adalto Picotti Junior on 24/02/23.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    let title: String
    let description: String
    var completion: Int
}
