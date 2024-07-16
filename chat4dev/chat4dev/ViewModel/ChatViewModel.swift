//
//  ChatViewModel.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 16/07/24.
//

import Foundation
import UIKit

class ChatViewModel: ObservableObject {
    func updateTextEditorHeight(newMessage: String) {
        var charCount = newMessage.count
        var textEditorHeight = charCount > 25 ? 80 : 40  // Ajuste baseado em um número aproximado de caracteres
    }

    
//    extension String {
//        func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
//            let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
//            let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
//            return boundingBox.height
//        }
//    }
}
