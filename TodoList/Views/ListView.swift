//
//  ListView.swift
//  TodoList
//
//  Created by Zaid Ragab on 2023-04-05.
//
import Blackbird
import SwiftUI

struct ListView: View {
    
    //MARK: stored Properties
    // Access the connection to the database (needed to add a new record
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    
    //lsit items to completed
    @BlackbirdLiveModels({ db in
        try await Todoitem.read(from: db)
    }) var todoItems
    
    @State var newitemDescrption: String = ""
    
    
    //MARK: computed Properties
    var body: some View {
        NavigationView{
            
            VStack{
                
                HStack{
                    TextField("enter to-do list item", text: $newitemDescrption)
                    
                    Button(action: {
                        Task {
                            try await db!.transaction { core in
                                try core.query("INSERT INTO Todoitem (descrition) values (?)", newitemDescrption)
                            }
                            
                        }
                        
                        
                    }, label: {
                        Text("Add")
                            .font(.caption)
                        
                    })
                    
                    
                    
                }
                .padding(20)
                
                List(todoItems.results) { currentItem in
                    
                    Label(title: {
                        Text(currentItem.description)
                    }, icon: {
                        if currentItem.completed == true {
                            Image(systemName:"checkmark.circle")
                        } else {
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
            .environment(\.blackbirdDatabase, AppDatabase.instance )
        
    }
}
