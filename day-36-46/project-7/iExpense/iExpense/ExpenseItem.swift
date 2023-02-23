//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Adalto Picotti Junior on 14/02/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
