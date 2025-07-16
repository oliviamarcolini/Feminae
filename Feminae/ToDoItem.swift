//
//  ToDoItem.swift
//  Feminae
//
//  Created by Olivia Monteiro on 7/16/25.
//

import Foundation
import SwiftData

@Model
class ToDoItem {
    var title: String
    var isImportant: Bool
    var isCompleted: Bool
    var subtasks: [ToDoItem]
    
    init(title: String, isImportant: Bool = false, isCompleted: Bool = false, subtasks: [ToDoItem] = []) {
        self.title = title
        self.isImportant = isImportant
        self.isCompleted = isCompleted
        self.subtasks = subtasks
    }
    
    var completionPercentage: Double {
        guard !subtasks.isEmpty else {
            return isCompleted ? 100 : 0
        }
        let completed = subtasks.filter { $0.isCompleted }.count
        return (Double(completed) / Double(subtasks.count)) * 100
    }
}
