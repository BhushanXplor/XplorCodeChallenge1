    //
    //  DetailListView.swift
    //  NewRecurringBooking
    //
    //  Created by Bhushan Gawande on 08/12/23.
    //

import SwiftUI

struct ChildListView: View {
    var title: String
    var childData: [ChildrenResponse]
    @Binding var selectedChild: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding(.trailing, 240)
                .padding(.top, 20)
            
            List {
                ForEach(childData, id: \.availableRoomsId) { item in
                    HStack {
                        RadioButton(id: item.availableRoomsId, selectedId: $selectedChild)
                        
                        Text("\(item.fullName)")
                            .font(.system(size: 16))
                    }
                    .onTapGesture {
                        print("tap on \( $selectedChild)")
                    }
                }
                .listRowSeparator(.hidden)
            }
            .frame(height: 100)
            .listStyle(.plain)
        }
        .border(.gray, width: 2)
        .padding()
    }
}

#Preview {
    ChildListView(title: "List View", childData: [ChildrenResponse(age: 7, fkey: "key", fullName: "Full Name", availableRoomsId: "roo id value")], selectedChild: .constant("item1"))
}
