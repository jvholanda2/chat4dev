//
//  MessageView.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 16/07/24.
//

import SwiftUI

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

#Preview {
    

    MessageRow(message: .init(content: "oi", isUser: true))
    //MessageRow(message: .init(content: "oi", isUser: false))
}
