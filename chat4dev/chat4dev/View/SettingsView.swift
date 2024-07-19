//
//  SettingsView.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 17/07/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("LightModeDarkMode") var lightOnDarkOff: Bool = true
    @AppStorage("Notifications") var notifications: Bool = true
    var body: some View {
        VStack {
            Text("Settings").font(.title)
                .padding(.bottom, 50)
                .bold()
            
            Toggle(isOn: $notifications) {
                Text("Notifications")
                Text(notifications ? "Caso deseje receber novas informações de fetures, blá blá blá..." : "Tá bom 🤐")
        
            }
            Toggle(isOn: $lightOnDarkOff) {
                Text(lightOnDarkOff ? "Light" : "Dark")
                Text(lightOnDarkOff ? "Ótimo dia! 😎" : "Luzes desligadas pessoal... 😴")
            }
            Spacer()
        }.padding()
    }
}
    
#Preview {
    SettingsView()
}


