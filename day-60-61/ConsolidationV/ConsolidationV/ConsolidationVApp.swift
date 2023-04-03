//
//  ConsolidationVApp.swift
//  ConsolidationV
//
//  Created by Adalto Picotti Junior on 09/03/23.
//

import SwiftUI

@main
struct ConsolidationVApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
