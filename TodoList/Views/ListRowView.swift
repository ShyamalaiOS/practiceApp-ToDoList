//
//  ListRowView.swift
//  TodoList
//
//  Created by Shyamala Ramanathan on 24/05/24.
//

import SwiftUI

struct ListRowView: View {
    var title : String
    var iscompleteStatus : Bool
    var body: some View {
        HStack{
            Image(systemName: iscompleteStatus ? "checkmark.circle" : "circle")
                .foregroundColor(iscompleteStatus ? .green : .red)
            Text(title)
            Spacer()
        }.font(.title2)
        .padding()
    }
}


#Preview {
    Group{
        ListRowView(title: "This is first title", iscompleteStatus: true)
        ListRowView(title: "This is Second title", iscompleteStatus: false)
    }.previewLayout(.sizeThatFits)
}
