//
//  Coordinator.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 22/07/24.
//

import SwiftUI

class LoginCoordinator: Coordinator {
    func push<Flow: Hashable>(_ flow: Flow) {
        self.path.append(flow)
    }
    
    func pop(_ k: Int = 1) {
        self.path.removeLast(k)
    }
    
    func popToRoot() {
        path = NavigationPath()
    }

    
    let id: UUID = UUID()

    @Published var path: NavigationPath

    init(path: NavigationPath = .init()) {
        self.path = path
    }

    func build() -> some View {
        LoginView(coordinator: self)
        //InitialFluxView()
    }
}

extension LoginCoordinator {
    enum Coordinates: String, Hashable {
        case signIn
        case chat
        case signOut
    }
}

extension LoginCoordinator {
    static func == (lhs: LoginCoordinator, rhs: LoginCoordinator) -> Bool {
        lhs.id == rhs.id
    }
}
