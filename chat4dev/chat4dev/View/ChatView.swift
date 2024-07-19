//
//  ChatView.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 16/07/24.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatViewModel = ChatViewModel()
    var body: some View {
        VStack {
            ScrollViewReader { scrollViewProxy in
                ScrollView {
                    ForEach(chatViewModel.messages) { message in
                        MessageView(message: message)
                            .id(message.id)  // Atribui um ID exclusivo para cada mensagem
                    }
                }
                .padding(.top)
                .onChange(of: chatViewModel.messages) { _ , _ in
                    // Rola para o final quando novas mensagens são adicionadas
                    if let lastMessageID = chatViewModel.messages.last?.id {
                        scrollViewProxy.scrollTo(lastMessageID, anchor: .bottom)
                    }
                }
            }
            HStack {
                TextEditor(text: $chatViewModel.newMessage)
                    .frame(minHeight: chatViewModel.textEditorHeight, maxHeight: chatViewModel.textEditorHeight)
                    .background(Color.gray.opacity(1))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .onChange(of: chatViewModel.newMessage) { _ , _ in
                        chatViewModel.updateTextEditorHeight()
                    }
                
                Button(action: chatViewModel.sendMessage) {
                    Text("Enviar")
                        .padding(10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        } .navigationTitle("Chat Theme")
    }
}

struct ContentView: View {
    var body: some View {
        ChatView()
    }
}




#Preview {
    ChatView()
}
