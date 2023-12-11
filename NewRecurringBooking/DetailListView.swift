//
//  DetailListView.swift
//  NewRecurringBooking
//
//  Created by Bhushan Gawande on 08/12/23.
//

import SwiftUI

struct DetailListView: View {
    var title: String
    var childData: [String]
    @Binding var selectedChild: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding(.trailing, 235)
                .padding(.top, 20)
            
            List {
                ForEach(0..<childData.count, id: \.self) { index in
                    let item = childData[index]
                    HStack {
                        RadioButton(item: item, selectedItem: $selectedChild)
                        Text("\(item)")
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
    DetailListView(title: "List View", childData: ["item1", "item2"], selectedChild: .constant("item1"))
}
