//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Adalto Picotti Junior on 06/03/23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
