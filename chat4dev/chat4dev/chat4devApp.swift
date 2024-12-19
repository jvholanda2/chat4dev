//
//  chat4devApp.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 15/07/24.
//

import SwiftUI

@main
struct chat4devApp: App {
    @StateObject var coordinator = LoginCoordinator()
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            InitialFluxView(coordinator: coordinator)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
