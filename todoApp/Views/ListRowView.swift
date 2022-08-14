//
//  ListRowView.swift
//  todoApp
//
//  Created by Yasin Beyazlı on 13.08.2022.
//

import SwiftUI

struct ListRowView: View {
    @EnvironmentObject var todoViewModel: TodoViewModel
    
    let todo: TodoModel
    var body: some View {
        HStack{
            Image(systemName: todo.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(todo.isCompleted ? .green : .red)
            Text(todo.title)
                .font(.title3)
                .strikethrough(todo.isCompleted)
            Spacer()
        }
        .frame(height: 60)
        .onTapGesture {
            withAnimation(.linear){
                todoViewModel.toogleItem(item: todo)
            }
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ListRowView(todo: TodoModel(title: "This is the first title!", isCompleted: false))
            ListRowView(todo: TodoModel(title: "This is the second!", isCompleted: true))
        }.previewLayout(.sizeThatFits)

    }
}
