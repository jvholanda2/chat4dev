//
//  TabView.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 17/07/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView<<#SelectionValue: Hashable#>, <#Content: View#>>
            ChatView()
            OnlyTestView()
        
    }

}

#Preview {
    TabBarView()
}
