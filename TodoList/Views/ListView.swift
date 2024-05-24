//
//  ListView.swift
//  TodoList
//
//  Created by Shyamala Ramanathan on 24/05/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listviewModel : ListViewModel
   
    var body: some View {
        List{
            ForEach(listviewModel.items) { item in
                ListRowView(title: item.title, iscompleteStatus: item.isCompleted)
                    .onTapGesture {
                        withAnimation {
                            self.listviewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listviewModel.deleteItem)
            .onMove(perform: listviewModel.moveItem)
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: {
                    AddItemView()
                })
        )
    }
    
    
}

#Preview {
    NavigationView{
        ListView()
            .environmentObject(ListViewModel())
    }
}


