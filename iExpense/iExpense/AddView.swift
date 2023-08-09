//
//  AddView.swift
//  iExpense
//
//  Created by Dulce Itamar Vigueras Ballesteros on 27/07/23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var currency = "MXN"
    
    let currencies  = ["MXN", "USD", "EUR","JPY", "CAD"]
  
    
    
    let types = ["Business", "Personal"]
    
    
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) { option in
                        Text(option)
                    }
                }
                
                Picker("currency", selection: $currency) {
                    ForEach(currencies, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.segmented)
                
                
                TextField("Amount", value: $amount, format: .currency(code: currency))
                    .keyboardType(.decimalPad)
  
            }
            
          
            .navigationTitle("Add new expense")
            .toolbar {
                ToolbarItem {
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: type, amount: amount, currency: currency)
                        expenses.items.append(item)
                        dismiss()
                    }
                }
            }
        }
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}


