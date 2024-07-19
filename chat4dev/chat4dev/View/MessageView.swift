//
//  MessageView.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 16/07/24.
//

import SwiftUI

struct MessageView: View {
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
                Text(formatDate(message.timestamp))
                    .font(.footnote)
                    .foregroundColor(.gray)
                
            } else {
                Text(message.content)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                Text(formatDate(message.timestamp))
                    .font(.footnote)
                    .foregroundColor(.gray)
                Spacer()
            }
        }
        .padding(5)
    }
}

private func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter.string(from: date)
}
#Preview {
    

    MessageView(message: .init(content: "oi", isUser: true, timestamp: Date()))
    //MessageRow(message: .init(content: "oi", isUser: false))
}
