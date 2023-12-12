    //
    //  ListDetailView.swift
    //  NewRecurringBooking
    //
    //  Created by Bhushan Gawande on 08/12/23.
    //

import SwiftUI

struct RadioButton: View {
    var id: String
    @Binding var selectedId: String
    @State var isChecked: Bool = false
    
    var body: some View {
        Group{
            HStack {
                if selectedId == id {
                    ZStack{
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill(Color.white)
                            .frame(width: 8, height: 8)
                    }.onTapGesture {
                        self.isChecked = !isChecked
                        selectedId = id
                        print("checked")
                    }
                } else {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 20, height: 20)
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        .onTapGesture {
                            self.isChecked = !isChecked
                            selectedId = id
                            print("unchecked")
                        }
                }
                
            }.frame(height: 24)
        }
    }
}

#Preview {
    RadioButton(id: "item", selectedId: .constant("item1"))
}
