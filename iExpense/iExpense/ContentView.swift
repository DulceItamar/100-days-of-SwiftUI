//
//  ContentView.swift
//  iExpense
//
//  Created by Dulce Itamar Vigueras Ballesteros on 27/07/23.
//

import SwiftUI




struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    let categories = ["All", "Personal", "Business"]
    @State var selectedCategory = "All"
    

    
    var items: [ExpenseItem] {
        if (selectedCategory == "All") {
            return Array(expenses.items)
        } else {
            return Array(expenses.items)
                .filter{ $0.type == selectedCategory }
                
        }
    }
    
    var body: some View {
        NavigationStack{
            Picker("Selected Cateogory", selection: $selectedCategory) {
                ForEach(categories, id: \.self) {
                    Text($0)
                }
            }.pickerStyle(.segmented)

            
            if items.isEmpty {
                Text("No items found.")
            }
            
            List {
                ForEach(items) { item in
                    
                    HStack{
                        VStack(alignment: .leading){
                            /*@START_MENU_TOKEN@*/Text(item.name)/*@END_MENU_TOKEN@*/.font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        Text(item.amount, format: .currency(code: item.currency))
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(colorOption(from: item.amount))
                    }
                }
                .onDelete(perform: removeItems)
                

                }
            
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem {
                    Button {
                        
                        showingAddExpense = true
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showingAddExpense) {
                        AddView(expenses: expenses)
                    }
                }
                
            }
        }
    }
    
//    var personalItems: [ExpenseItem] {
//            items.filter { $0.type == "Personal" }
//        }
//
//        var businessItems: [ExpenseItem] {
//            items.filter { $0.type == "Business" }
//        }
    
    func removeItems(at offsets: IndexSet) {
        
        for offset in offsets {

            if let index = expenses.items.firstIndex(where: { $0.id == items[offset].id }){
                expenses.items.remove(at: index)
            }
        }
    }
    
    
    
    func colorOption(from amount: Double) -> Color {
        var option: Color
        let one = Color(red: 181/255, green: 172/255, blue: 233/255)
        let two = Color(red: 186/255, green: 45/255, blue: 11/255)
        let three = Color(red: 115/255, green: 186/255, blue: 155/255)
        
        if amount <= 10 && amount > 0 {
            option = one
        } else if amount > 10 && amount <= 100{
            option = two
        } else {
            option = three
        }
        return option
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
