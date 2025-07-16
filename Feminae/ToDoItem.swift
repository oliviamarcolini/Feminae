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
    var isCompleted: Bool
    var parent: ToDoItem?
    @Relationship(deleteRule: .cascade, inverse: \ToDoItem.parent) var subtasks: [ToDoItem]

    init(title: String, isCompleted: Bool = false, parent: ToDoItem? = nil, subtasks: [ToDoItem] = []) {
        self.title = title
        self.isCompleted = isCompleted
        self.parent = parent
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

extension ToDoItem: Identifiable {}


