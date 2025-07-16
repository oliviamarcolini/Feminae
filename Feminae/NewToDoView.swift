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
    @Bindable var toDoItem: ToDoItem
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            Text("Task title:")
            TextField("Enter the task description...", text: $toDoItem.title, axis: .vertical)
            Toggle(isOn: $toDoItem.isImportant) {
                Text("Is it important?")
            }
            
            Button {
                addToDo()
                showNewTask = false
            } label: {
                    Text("Save")
            }
            
        } //VStack
        .padding()
        
            }
    
    func addToDo() {
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        modelContext.insert(toDo)
    }
    
}

#Preview {
    NewToDoView(showNewTask: .constant(false), toDoItem: ToDoItem(title: "", isImportant: false))
}
