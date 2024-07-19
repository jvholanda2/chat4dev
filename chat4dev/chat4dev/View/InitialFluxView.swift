//
//  InitialFluxView.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 17/07/24.
//

import SwiftUI

struct InitialFluxView: View {
    @State var path: NavigationPath = .init()
    @State var isLoggedIn: Bool = false
    var body: some View {
        NavigationStack(path: $path) {
            if isLoggedIn {
                TabBarView(isLoggedIn: $isLoggedIn)
            } else {
                LogginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

#Preview {
    InitialFluxView()
}


import SwiftUI


