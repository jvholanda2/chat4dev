//
//  TabView.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 17/07/24.
//

import SwiftUI

struct TabBarView: View {
    @Binding var isLoggedIn: Bool
    @ObservedObject var coordinator: LoginCoordinator
    var body: some View {
        TabView {
            ListChatsView(coordinator: coordinator)
                .tabItem {
                    Label("Chat", systemImage: "character.bubble.fill")
                }
            SettingsView(coordinator: coordinator)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    TabBarView(isLoggedIn: .constant(true), coordinator: .init())
}
