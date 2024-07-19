//
//  MessageViewModel.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 16/07/24.
//

import Foundation

struct Message: Identifiable, Equatable {
    let id = UUID()
    let content: String
    let isUser: Bool
    let timestamp: Date
    
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id
    }
}
