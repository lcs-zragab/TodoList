//
//  ListView.swift
//  TodoList
//
//  Created by Zaid Ragab on 2023-04-05.
//

import SwiftUI

struct ListView: View {
    //MARK: stored Properties
    
    //lsit items to completed
    @State var ToDoItems: [ToDoItem] = exestingToDpItem
    
    @State var newitemDescrption: String = ""
    
    
    //MARK: computed Properties
    var body: some View {
        NavigationView{
            
            VStack{
                
                HStack{
                    TextField("enter to-do list item", text:$newitemDescrption)
                    
                    Button(action:{
                        // get last to do item
                        let lastId = ToDoItems.last!.id
                        // create new item
                        let NewId = lastId + 1
                        // creat the new to do item
                        let newtodoitem = ToDoItem(id: NewId, descritption: newitemDescrption,
                                                   completed: false)
                        // create new item
                        ToDoItems.append(newtodoitem)
                        // clear ipute feild
                        newitemDescrption = ""
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    }, label: {
                        Text("Add")
                            .font(.caption)
                        
                    })
                
                    
                    
                }
                .padding(20)
                
                List(ToDoItems) {currentItem in
                    
                    Label(title: { Text(currentItem.descritption) }, icon: {if currentItem.completed == true{
                        
                        Image( systemName:"checkmark.circle") }
                        else {
                            Image(systemName: "circle")
                        }
                    })
                    
                }
            }
            .navigationTitle("To Do")
        }
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
