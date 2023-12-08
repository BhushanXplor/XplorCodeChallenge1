//
//  RoomListView.swift
//  NewRecurringBooking
//
//  Created by Bhushan Gawande on 08/12/23.
//

import SwiftUI

struct RoomListView: View {
    @Binding var roomData: [String]
    @Binding var selectedItem: String
    
    var body: some View {
        
        List(roomData, id: \.self) { item in
            ListDetailView(item: $selectedItem, selectedItem: .constant(item))
                .listRowSeparator(.hidden)
        }.environment(\.defaultMinListRowHeight, 20)
            .listStyle(.plain)
    }
}

#Preview {
    RoomListView(roomData: .constant(["Sample1", "Sample2"]), selectedItem: .constant("sample2"))
}
