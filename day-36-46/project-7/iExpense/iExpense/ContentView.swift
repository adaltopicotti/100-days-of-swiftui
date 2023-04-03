//
//  ContentView.swift
//  iExpense
//
//  Created by Adalto Picotti Junior on 13/02/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Business") {
                    ForEach(expenses.items.filter { $0.type == "Business" }) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "BRL"))
                                .foregroundColor(item.amount < 10 ? .green : (item.amount > 100 ? .red : .blue))
                        }
                        .accessibilityElement()
                        .accessibilityLabel("\(item.name) \(item.amount, format: .currency(code: Locale.current.currencyCode ?? "BRL"))")
                        
                    }
                    
                    .onDelete(perform: removeItems)
                }
                
                Section("Personal") {
                    ForEach(expenses.items.filter { $0.type == "Personal" }) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "BRL"))
                                .foregroundColor(item.amount < 10 ? .green : (item.amount > 100 ? .red : .blue))
                        }
                        
                    }
                    
                    .onDelete(perform: removeItems)
                }
            }
            .listStyle(.plain)
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
