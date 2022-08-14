//
//  AddView.swift
//  todoApp
//
//  Created by Yasin Beyazlı on 13.08.2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var todoViewModel: TodoViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    TextField("Type something here...", text: $textFieldText)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                        .cornerRadius(10)
                    Button {
                        saveButtonPressed()
                    } label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }

                }.padding(14)
                Spacer()
            }
            .navigationTitle("Add an Item 🖋")
            .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text(alertTitle)
                    )
                }
        }
        .navigationViewStyle(.automatic)
    }
    
    func saveButtonPressed(){
        if textIsAppropriate() {
            todoViewModel.addItem(toDo: TodoModel(title: textFieldText, isCompleted: false))
            dismiss()
        }
       
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!"
            showAlert.toggle()
            return false
        }
        return true
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
