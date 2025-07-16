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
    @State private var showNewSubtaskFor: ToDoItem? = nil
    @Query(filter: #Predicate<ToDoItem> { $0.parent == nil }) var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        ZStack {
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
                    ForEach(toDos) { toDo in
                        DisclosureGroup {
                            ForEach(toDo.subtasks) { subtask in
                                Toggle(isOn: Binding(
                                    get: { subtask.isCompleted },
                                    set: { newValue in
                                        subtask.isCompleted = newValue
                                    }
                                )) {
                                    Text(subtask.title)
                                }
                            }
                            Button("Add Subtask") {
                                showNewSubtaskFor = toDo
                            }
                        } label: {
                            HStack {
                                Text(toDo.title)
                                    .fontWeight(toDo.isImportant ? .bold : .regular)
                                Spacer()
                                Text("\(Int(toDo.completionPercentage))%")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                            }
                        }
                    }
                    .onDelete(perform: deleteToDo)
                }

            } //VStack
            
            if showNewTask {
                NewToDoView(showNewTask: $showNewTask, toDoItem: ToDoItem(title: "", isImportant: false))
            }
            
        } //ZStack
        
            .sheet(item: $showNewSubtaskFor) { parent in
                NewSubtaskView(
                    parentTask: .constant(parent),
                    isPresented: Binding(
                        get: { showNewSubtaskFor != nil },
                        set: { showNewSubtaskFor = $0 ? parent : nil }
                    )
                )
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
