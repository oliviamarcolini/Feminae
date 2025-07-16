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
                                        withAnimation {
                                            subtask.isCompleted = newValue
                                        }
                                    }
                                )) {
                                    Text(subtask.title)
                                        .opacity(subtask.isCompleted ? 0.4 : 1.0)
                                        .foregroundColor(.primary)
                                        .strikethrough(subtask.isCompleted)
                                }
                            }
                            Button("Add Subtask") {
                                showNewSubtaskFor = toDo
                            }
                        } label: {
                            HStack {
                                Text(toDo.title)
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
            
            .sheet(isPresented: $showNewTask) {
                NewToDoView(showNewTask: $showNewTask)
                    .presentationDetents([.fraction(0.3), .medium])
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
                .presentationDetents([.fraction(0.25), .medium])
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
