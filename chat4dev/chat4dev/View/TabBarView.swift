//
//  TabView.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 17/07/24.
//

import SwiftUI

struct TabBarView: View {
    @Binding var isLoggedIn: Bool
    var body: some View {
        TabView {
            ListChatsView()
                .tabItem {
                    Label("Chat", systemImage: "character.bubble.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    TabBarView(isLoggedIn: .constant(true))
}
