//
//  HomeView.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 17/07/24.
//

import SwiftUI

struct HomeView: View {
    @Binding var isLoggedIn: Bool
    var body: some View {
        NavigationStack {
        Text("HomeView")
            NavigationLink(destination: ChatView()) {
                Text("Novo Chat")
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView(isLoggedIn: .constant(true))
}
