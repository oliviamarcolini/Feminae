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
    
    init(title: String, isImportant: Bool = false) {
          self.title = title
          self.isImportant = isImportant
    }
}
