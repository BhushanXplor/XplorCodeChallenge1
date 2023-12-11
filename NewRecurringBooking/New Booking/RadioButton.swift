    //
    //  ListDetailView.swift
    //  NewRecurringBooking
    //
    //  Created by Bhushan Gawande on 08/12/23.
    //

import SwiftUI

struct RadioButton: View {
    var item: String
    @Binding var selectedItem: String
    
    @State var isChecked: Bool = false
    
    var body: some View {
        Group{
            HStack {
                if selectedItem == item {
                    ZStack{
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill(Color.white)
                            .frame(width: 8, height: 8)
                    }.onTapGesture {
                        self.isChecked = !isChecked
                        selectedItem = ""
                        print("tap1")
                    }
                } else {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 20, height: 20)
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        .onTapGesture {
                            self.isChecked = !isChecked
                            selectedItem = item
                            
                        }
                }
                
            }.frame(height: 24)
        }
    }
}

#Preview {
    RadioButton(item: "item", selectedItem: .constant("item1"))
}
