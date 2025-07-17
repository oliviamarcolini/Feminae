//
//  NewToDoView.swift
//  Feminae
//
//  Created by Olivia Monteiro on 7/16/25.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    @Binding var showNewTask: Bool
    @Environment(\.modelContext) var modelContext
    @State private var title: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Task title:")
            TextField("Enter the task description...", text: $title, axis: .vertical)
                .textFieldStyle(.roundedBorder)

            Button("Save") {
                let newTask = ToDoItem(title: title)
                modelContext.insert(newTask)
                showNewTask = false
            }.foregroundColor(.purple)
        }
        .padding()
    }
}

#Preview {
    NewToDoView(showNewTask: .constant(false))
}
