//
//  TodoViewModel.swift
//  todoApp
//
//  Created by Yasin Beyazlı on 13.08.2022.
//

import Foundation

class TodoViewModel: ObservableObject {
    @Published var items: [TodoModel] = []
    @Published var title: String = "Todo List"
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems: [TodoModel] = [
            TodoModel(title: "This is the first title!", isCompleted: false),
            TodoModel(title: "This is the second!", isCompleted: true),
            TodoModel(title: "Third!", isCompleted: false),
        ]
        items.append(contentsOf: newItems)
    }
    
    func addItem(toDo: TodoModel){
        items.insert(toDo, at: 0)
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(indexSet: IndexSet, to: Int){
        items.move(fromOffsets: indexSet, toOffset: to)
    }
    
    func toogleItem(item: TodoModel) {
         if let index = items.firstIndex(where: { $0.id == item.id }) {
             items[index].isCompleted.toggle()
         }
        
    }
}
