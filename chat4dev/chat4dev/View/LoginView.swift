import SwiftUI

struct LoginView: View {
    @ObservedObject var coordinator: LoginCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack {
                Button("SignIn") {
                    coordinator.push(LoginCoordinator.Coordinates.signIn)
                }
                Button("SignOut") {
                    coordinator.push(LoginCoordinator.Coordinates.signOut)
                }
            }
            .navigationTitle("Coord")
        }
    }
}

#Preview {
    LoginView(coordinator: LoginCoordinator())
}
