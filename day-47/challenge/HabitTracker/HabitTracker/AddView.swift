//
//  AddView.swift
//  HabitTracker
//
//  Created by Adalto Picotti Junior on 24/02/23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var activities: Activities
    
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                }
                
                Section {
                    TextField("Description", text: $description)
                }
                
            }
            .navigationTitle("Add new activity")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Save") {
                    let activity = Activity(title: title, description: description, completion: 0)
                    activities.items.append(activity)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
