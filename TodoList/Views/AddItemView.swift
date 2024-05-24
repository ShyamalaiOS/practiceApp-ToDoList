//
//  AddItemView.swift
//  TodoList
//
//  Created by Shyamala Ramanathan on 24/05/24.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textfeildText : String = ""
    
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type Todo data...", text: $textfeildText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.lightGray))
                    .cornerRadius(10)
                Button(action: {savePressedItem(title: textfeildText)}, label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        
                })
            }.padding(14)
        }
            .navigationTitle("Add Item 🖊️")
            .alert(isPresented: $showAlert, content: {
                getalert()
            })
    }
    
    func getalert() -> Alert{
        return Alert(title : Text(alertTitle))
    }
    
    func savePressedItem(title : String){
        if checkCharacter(){
            self.listViewModel.addItem(title: title)
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func checkCharacter() -> Bool{
        if textfeildText.count < 3{
            alertTitle = "please enter valid item into the list"
            showAlert.toggle()
            return false
        }
        return true
    }
}

#Preview {
    NavigationView{
        AddItemView()
    }.environmentObject(ListViewModel())
}
