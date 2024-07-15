//
//  chat4devApp.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 15/07/24.
//

import SwiftUI

@main
struct chat4devApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
