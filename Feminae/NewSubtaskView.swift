//
//  NewSubtaskView.swift
//  Feminae
//
//  Created by Olivia Monteiro on 7/16/25.
//

import SwiftUI
import SwiftData

struct NewSubtaskView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var parentTask: ToDoItem?
    @Binding var isPresented: Bool
    @State private var title: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("New Subtask for: \(parentTask?.title ?? "")")
                .font(.headline)

            TextField("Subtask title", text: $title)
                .textFieldStyle(.roundedBorder)

            Button("Save") {
                if let parent = parentTask {
                    let newSubtask = ToDoItem(title: title, parent: parent)
                    modelContext.insert(newSubtask)
                }
                isPresented = false
            }.foregroundColor(.purple)

        }
        .padding()
    }
}
