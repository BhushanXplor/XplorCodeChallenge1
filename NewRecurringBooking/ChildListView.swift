//
//  ChildListView.swift
//  NewRecurringBooking
//
//  Created by Bhushan Gawande on 08/12/23.
//

import SwiftUI

struct ChildListView: View {
    @Binding var childData: [String]
    @Binding var selectedItem: String
    
    var body: some View {
        List($childData, id: \.self) { item in
            ListDetailView(item: item, selectedItem: $selectedItem)
                .listRowSeparator(.hidden)
        }.environment(\.defaultMinListRowHeight, 50)
            .listStyle(.plain)
        .onTapGesture {
            print("child tap")
        }
    }
}
 
#Preview {
    ChildListView(childData: .constant(["Sample1", "Sample2"]), selectedItem: .constant("Sample2"))
}
