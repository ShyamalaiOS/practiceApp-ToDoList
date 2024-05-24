//
//  ListViewModel.swift
//  TodoList
//
//  Created by Shyamala Ramanathan on 24/05/24.
//

import Foundation

class ListViewModel : ObservableObject{
    var items : [ItemModel] = [ItemModel]()
    init(){
        self.getItem()
    }
    
    func getItem(){
        let item = [
            ItemModel(title: "This is First Item", isCompleted: true),
            ItemModel(title: "This is Second Item", isCompleted: false),
            ItemModel(title: "This is Third Item", isCompleted: true),
        ]
        items.append(contentsOf: item)
    }
    func deleteItem(indexSet : IndexSet){
        self.items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from : IndexSet, to : Int){
        self.items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title : String){
        self.items.append(ItemModel(title: title, isCompleted: false))
        print(items)
    }
    
    func updateItem(item : ItemModel){
        if let itemIndex = items.firstIndex(where: {$0.title == item.title}){
            self.items[itemIndex] = ItemModel(title: item.title, isCompleted: !item.isCompleted)
        }else{
            print("sorrrry!")
        }
    }
}
