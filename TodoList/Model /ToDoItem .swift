//
//  ToDoItem .swift
//  TodoList
//
//  Created by Zaid Ragab on 2023-04-05.
//

import Foundation
import Blackbird

struct Todoitem: BlackbirdModel {
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var description: String
    @BlackbirdColumn var completed: Bool
}
