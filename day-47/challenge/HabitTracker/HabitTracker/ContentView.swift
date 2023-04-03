//
//  ContentView.swift
//  HabitTracker
//
//  Created by Adalto Picotti Junior on 24/02/23.
//

// TODO: [] - Form to add activities
// TODO: [] - List of all activities they want to track
// TODO: [] - Detail screen

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    @State private var showingAddActivity = false
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { item in
                    NavigationLink {
                        ActivityDetailView(activity: item, activities: activities)
                    } label: {
                        VStack(alignment: .leading) {
                            Text("\(item.title)")
                                .font(.headline)
                            Text("Completed \(item.completion) times")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button {
                    showingAddActivity = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddView(activities: activities)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
