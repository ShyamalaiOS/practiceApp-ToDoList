//
//  ItemModel.swift
//  TodoList
//
//  Created by Shyamala Ramanathan on 24/05/24.
//

import Foundation

struct ItemModel : Identifiable{
    var id : String = UUID().uuidString
    var title : String
    var isCompleted : Bool
}
