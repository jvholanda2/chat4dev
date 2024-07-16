//
//  ChatView.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 16/07/24.
//

import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let content: String
    let isUser: Bool
}


struct ChatView2: View {
    var body: some View {
        
        Text("oi")
        //MessageRow(message: 01, "oi", true)
    }
}

struct MessageRow: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
                Text(message.content)
                    .padding(10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            } else {
                Text(message.content)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                Spacer()
            }
        }
        .padding(5)
    }
}

struct ChatView: View {
    @State private var messages: [Message] = [
        Message(content: "Olá! Como posso ajudar?", isUser: false)
    ]
    @State private var newMessage: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(messages) { message in
                    MessageRow(message: message)
                }
            }
            .padding(.top)
            
            HStack {
                TextField("Digite uma mensagem...", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: sendMessage) {
                    Text("Enviar")
                        .padding(10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
    
    private func sendMessage() {
        guard !newMessage.isEmpty else { return }
        let message = Message(content: newMessage, isUser: true)
        messages.append(message)
        newMessage = ""
        
        // Simulação de resposta automática
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let response = Message(content: "Esta é uma resposta automática.", isUser: false)
            messages.append(response)
        }
    }
}

struct ContentView2: View {
    var body: some View {
        ChatView()
    }
}

@main
struct ChatApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView2()
        }
    }
}



#Preview {
    ChatView()
}
