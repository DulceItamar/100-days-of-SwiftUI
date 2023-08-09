//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Dulce Itamar Vigueras Ballesteros on 27/07/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id =  UUID()
    let name: String
    let type: String
    let amount: Double
    let currency: String
}
