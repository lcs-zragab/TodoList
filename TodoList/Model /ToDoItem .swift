//
//  ToDoItem .swift
//  TodoList
//
//  Created by Zaid Ragab on 2023-04-05.
//

import Foundation

struct ToDoItem: Identifiable{
    var id: Int
    var descritption: String
    var completed: Bool
    
}

var exestingToDpItem = [
    
    ToDoItem(id: 1, descritption: "Study for math test", completed: false)
    
    ,
    
    ToDoItem(id: 2, descritption: "Go to Gym", completed: true)
    
    ,
    
    ToDoItem(id: 3, descritption: "Take a Nap", completed: true)
    
]
