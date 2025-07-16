//
//  ToDoList.swift
//  Feminae
//
//  Created by Dhiraj Tiwari on 7/15/25.
//

import SwiftUI
import SwiftData

struct ToDoList: View {
    
    @State private var showNewTask = false
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            HStack {
                Text("To Do List")
                     .font(.system(size: 40))
                     .fontWeight(.black)
                Spacer()
                
                Button {
                    withAnimation{
                        showNewTask = true
                    }
                } label: {
                    Text("+")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
            } //HStack
            .padding()
            Spacer()
            
            List {
                ForEach(toDos) { toDoItem in
                    DisclosureGroup {
                        ForEach(toDoItem.subtasks.indices, id: \.self) { index in
                            HStack {
                                Toggle(isOn: Binding(
                                    get: { toDoItem.subtasks[index].isCompleted },
                                    set: { newValue in
                                        toDoItem.subtasks[index].isCompleted = newValue
                                    })) {
                                        Text(toDoItem.subtasks[index].title)
                                }
                            }
                        }
                    } label: {
                        VStack(alignment: .leading) {
                            Text(toDoItem.title)
                                .fontWeight(toDoItem.isImportant ? .bold : .regular)
                            Text("\(Int(toDoItem.completionPercentage))% completed")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }

        } //VStack
        if showNewTask {
            NewToDoView(showNewTask: $showNewTask, toDoItem: ToDoItem(title: "", isImportant: false))
        }
    } //body
    
    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
    
} //struct

#Preview {
    ToDoList()
        .modelContainer(for: ToDoItem.self, inMemory: true)
}
