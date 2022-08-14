//
//  ListView.swift
//  todoApp
//
//  Created by Yasin Beyazlı on 13.08.2022.
//

import SwiftUI

struct ListView: View {
    @StateObject var todoViewModel: TodoViewModel = TodoViewModel()
    var body: some View {
        NavigationView{
            List{
                ForEach(todoViewModel.items) { item in
                    ListRowView(todo: item)
                }
                .onDelete(perform: todoViewModel.deleteItem)
                .onMove(perform: todoViewModel.moveItem)
            }.listStyle(.plain)
            .navigationTitle("Todo List 📝")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add", destination: AddView())
                }
            }
        }.environmentObject(todoViewModel)
    }
    

    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}


