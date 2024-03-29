//
//  Expenses.swift
//  iExpense
//
//  Created by Dulce Itamar Vigueras Ballesteros on 27/07/23.
//

import Foundation

class Expenses: ObservableObject {
    
    

    
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let saveItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: saveItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }

    
}
