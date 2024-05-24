//
//  TodoListApp.swift
//  TodoList
//
//  Created by Shyamala Ramanathan on 23/05/24.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var liveViewModel : ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }.environmentObject(liveViewModel)
        }
    }
}
