//
//  InitialFluxView.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 17/07/24.
//

import SwiftUI

struct InitialFluxView: View {
    //@State var path: NavigationPath = .init()
    @State var isLoggedIn: Bool = false
    @ObservedObject var coordinator: LoginCoordinator
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            if isLoggedIn {
                TabBarView(isLoggedIn: $isLoggedIn, coordinator: coordinator)
            } else {
                LogginView(isLoggedIn: $isLoggedIn)
            }
        }.navigationDestination(for: LoginCoordinator.Coordinates.self) { coordinate in
            switch coordinate {
            case .signIn:
                TabBarView(isLoggedIn: $isLoggedIn, coordinator: coordinator)
            case .signOut:
                LogginView(isLoggedIn: $isLoggedIn)
            case .chat:
                ChatView()
            }
        }
    }
}

#Preview {
    InitialFluxView(coordinator: LoginCoordinator())
}





