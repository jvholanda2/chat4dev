//
//  ChatViewModel.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 16/07/24.
//

import Foundation
import SwiftUI

class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = [
        Message(content: "Olá! Como posso ajudar?", isUser: false, timestamp: Date()),
    ]
    @Published var newMessage: String = ""
    @Published var textEditorHeight: CGFloat = 40
    
    func sendMessage() {
        guard !newMessage.isEmpty else { return }
        let message = Message(content: newMessage, isUser: true, timestamp: Date())
        messages.append(message)
        newMessage = ""
        textEditorHeight = 40
        
        // Simulação de resposta automática
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let response = Message(content: "Esta é uma resposta automática.", isUser: false, timestamp: Date())
            self.messages.append(response)
        }
    }
    
    
    func updateTextEditorHeight() {
        let numLines = newMessage.split(whereSeparator: \.isNewline).count
        let charCount = newMessage.count

        textEditorHeight = (numLines > 1 || charCount > 30) ? 80 : 40
    }
}

