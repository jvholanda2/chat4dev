//
//  LogginView.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 18/07/24.
//

import SwiftUI

struct LogginView: View {
    @Binding var isLoggedIn: Bool
    @ObservedObject var coordinator: LoginCoordinator
    var body: some View {
        Text("Login")
        Button(action: { 
            //isLoggedIn = true
            coordinator.push(LoginCoordinator.Coordinates.signIn)
        }) {
            HStack(alignment: .center, spacing: -2) {
                Spacer()
                Text("Entrar")
                    .foregroundColor(Color.white)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .background(Color(red: 0, green: 0.11, blue: 0.2))
            .cornerRadius(10)
        }
        Button("Entrar") {
            coordinator.push(LoginCoordinator.Coordinates.signIn)
        }
    }
}

#Preview {
    LogginView(isLoggedIn: .constant(false), coordinator: .init())
}
