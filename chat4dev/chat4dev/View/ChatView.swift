//
//  ChatView.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 16/07/24.
//

import SwiftUI

struct ChatView: View {
    @State private var messages: [Message] = [
        Message(content: "Olá! Como posso ajudar?", isUser: false),
        Message(content: "Olá! Como posso ajudar?", isUser: true),
        Message(content: "Olá! Como posso ajudar?", isUser: false),
        Message(content: "Olá! Como posso ajudar?", isUser: true),
        Message(content: "Olá! Como posso ajudar?", isUser: false),
        Message(content: "Olá! Como posso ajudar?", isUser: false)
    ]
    @State private var newMessage: String = ""
    @State private var textEditorHeight: CGFloat = 40
    //let chatViewModel: ChatViewModel = ChatViewModel()
    var body: some View {
        VStack {
            ScrollViewReader { scrollViewProxy in
                ScrollView {
                    ForEach(messages) { message in
                        MessageRow(message: message)
                            .id(message.id)  // Atribui um ID exclusivo para cada mensagem
                    }
                }
                .padding(.top)
                .onChange(of: messages) { _ in
                    // Rola para o final quando novas mensagens são adicionadas
                    if let lastMessageID = messages.last?.id {
                        scrollViewProxy.scrollTo(lastMessageID, anchor: .bottom)
                    }
                }
            }
            
            HStack {
                TextEditor(text: $newMessage)
                    .frame(minHeight: textEditorHeight, maxHeight: textEditorHeight)
                    .background(Color.gray.opacity(1))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .onChange(of: newMessage) { value in
                       // chatViewModel.updateTextEditorHeight(newMessage: newMessage)
                        updateTextEditorHeight()
                    }
                
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
        textEditorHeight = 40
        
        // Simulação de resposta automática
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let response = Message(content: "Esta é uma resposta automática.", isUser: false)
            messages.append(response)
        }
    }
    private func updateTextEditorHeight() {
        let charCount = newMessage.count
        let numLines = newMessage.split(separator: "\n").count
        var condition = if (charCount > 30 || numLines > 1) {true}
        textEditorHeight = condition ? 80 : 40  // Ajuste baseado em um número aproximado de caracteres
    }


//    private func updateTextEditorHeight() {
//        let maxLines: CGFloat = 4
//        let lineHeight: CGFloat = UIFont.systemFont(ofSize: UIFont.systemFontSize).lineHeight
//        let maxHeight = lineHeight * maxLines
//        let currentHeight = newMessage.height(withConstrainedWidth: UIScreen.main.bounds.width * 0.7, font: UIFont.systemFont(ofSize: UIFont.systemFontSize))
//        textEditorHeight = min(maxHeight, max(40, currentHeight + 20))
//    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return boundingBox.height
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
