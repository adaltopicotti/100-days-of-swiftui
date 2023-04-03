//
//  Bookworm_v2App.swift
//  Bookworm_v2
//
//  Created by Adalto Picotti Junior on 03/03/23.
//

import SwiftUI

@main
struct Bookworm_v2App: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
