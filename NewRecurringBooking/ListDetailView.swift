//
//  ListDetailView.swift
//  NewRecurringBooking
//
//  Created by Bhushan Gawande on 08/12/23.
//

import SwiftUI

struct ListDetailView: View {
    @Binding var item: String
    @Binding var selectedItem: String

    @State var isChecked: Bool = false
    
    var body: some View {
        Group{
            HStack {
                if isChecked {
                    ZStack{
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill(Color.white)
                            .frame(width: 8, height: 8)
                    }.onTapGesture {
//                        self.isChecked = item == selectedItem
//                        self.checked = false
                        self.isChecked = !isChecked

                        print("tap1")
                    }
                } else {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 20, height: 20)
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        .onTapGesture {
//                            self.isChecked = item == selectedItem

                            self.isChecked = !isChecked
                        }

                }

                Text("\(item)")
                    .font(.system(size: 16))
                    
            }.frame(height: 24)
        }.padding()
    }
}

#Preview {
    ListDetailView(item: .constant("Child Name"), selectedItem: .constant("Child Name"))
}
