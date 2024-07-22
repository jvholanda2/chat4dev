//
//  ListChatsView.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 18/07/24.
//

import SwiftUI
import CoreData

//struct ListChatsView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//    var chatIsEmpty: Bool = false
//    @State private var isShowingNewChat = false
//    @State private var newChatItem: Item? = nil
//    @State private var newChatItemID: NSManagedObjectID?
//    //@State var numberOfChats:Int = 3
//    var body: some View {
//        VStack {
//            if chatIsEmpty {
//                ChatIsEmptyView()
//            } else {
//                NavigationView {
//                    List {
//                        ForEach(items) { item in
//                            NavigationLink {
//                                ChatView()
//                                Text("Chat criado em \(item.timestamp!, formatter: itemFormatter)")
//                            } label: {
//                                HStack {
//                                    Text("Nome do Chat")
//                                    Spacer()
//                                    Text(item.timestamp!, formatter: itemFormatter).font(.custom("tal", size: 0.05))
//                                }
//                                
//                            }
//                        }
//                        .onDelete(perform: deleteItems)
//                    }
//                }
//            }
//        }
//        .toolbar {
//////                ToolbarItem(placement: .navigationBarTrailing) {
//////                    EditButton()
//////                }
//            ToolbarItem {
//                Button(action: addItem ) {
//                    Text("Novo Chat")
//                    Label("Novo Chat", systemImage: "plus.bubble.fill")
//                }
//            }
////            ToolbarItem(placement: .navigationBarTrailing) {
////                NavigationLink(destination: ChatView(), isActive: $isShowingNewChat) {
////                    Button(action: { addItem() }) {
////                        Label("Novo Chat", systemImage: "plus.bubble.fill")
////                    }
////                }
////            }
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button("Help") {
//                    print("Help tapped!")
//                }
//            }
////            ToolbarItem(placement: .navigationBarTrailing) {
////                Button("Novo Chat") {
////                    addItem()
////                }
////            }
//        }
//        
//        
//        
//    }
//    
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//            
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//    
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//            
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//    
//    private func addItemm() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//            
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//}
//
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
////private func formatDate(_ date: Date) -> String {
////    let calendar = Calendar.current
////    if calendar.isDateInToday(date) {
////        return timeFormatter.string(from: date)
////    } else {
////        return dateFormatter.string(from: date)
////    }
////}
////
////private let dateFormatter: DateFormatter = {
////    let formatter = DateFormatter()
////    formatter.dateStyle = .short
////    formatter.timeStyle = .none
////    return formatter
////}()
////
////private let timeFormatter: DateFormatter = {
////    let formatter = DateFormatter()
////    formatter.dateStyle = .none
////    formatter.timeStyle = .short
////    return formatter
////}()
//

struct ListChatsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @ObservedObject var coordinator: LoginCoordinator
    @State private var newChatItemID: NSManagedObjectID?
    var chatIsEmpty: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                if chatIsEmpty {
                    ChatIsEmptyView()
                } else {
                    List {
                        ForEach(items) { item in
                            NavigationLink(destination: ChatView(), tag: item.objectID, selection: $newChatItemID) {
                                HStack {
                                    Text("Nome do Chat")
                                    Spacer()
                                    Text(item.timestamp!, formatter: itemFormatter)
                                        .font(.custom("tal", size: 0.05))
                                }
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Help") {
                        print("Help tapped!")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addItem) {
                        Label("Novo Chat", systemImage: "plus.bubble.fill")
                    }
                }
            }
            .navigationTitle("Meus Chats")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            
            do {
                try viewContext.save()
                newChatItemID = newItem.objectID  // Define o ID do novo item para navegação
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ListChatsView(coordinator: .init()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}


//#Preview {
//    ListChatsView()
//}
