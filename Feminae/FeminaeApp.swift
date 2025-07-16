//
//  FeminaeApp.swift
//  Feminae
//
//  Created by Olivia Monteiro on 7/15/25.
//

import SwiftUI
import SwiftData

@main
struct FeminaeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
