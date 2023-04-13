//
//  TodoListApp.swift
//  TodoList
//
//  Created by Zaid Ragab on 2023-04-03.
//
import Blackbird
import SwiftUI

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup{
            ListView()
                .environment(\.blackbirdDatabase, AppDatabase.instance )
        }
    }
}
