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
    @Binding var selectedChild: ChildrenResponse?
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding(.trailing, 240)
                .padding(.top, 20)
            
            List {
                ForEach(childData, id: \.availableRoomsId) { item in
                    HStack {                        
                        Group{
                            HStack {
                                if item.availableRoomsId ==  selectedChild?.availableRoomsId {
                                    ZStack{
                                        Circle()
                                            .fill(Color.blue)
                                            .frame(width: 20, height: 20)
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 8, height: 8)
                                    }
                                } else {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 20, height: 20)
                                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                }
                                
                            }.frame(height: 24)
                        }
                        
                        Text("\(item.fullName)")
                            .font(.system(size: 16))
                            .foregroundColor(item.availableRoomsId ==  selectedChild?.availableRoomsId ? .blue : .black)
                    }
                    .onTapGesture {
                        selectedChild = item
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
    ChildListView(title: "List View", childData: [ChildrenResponse(age: 0, fkey: "fkey", fullName: "FullName", availableRoomsId: "12")], selectedChild: .constant(ChildrenResponse(age: 0, fkey: "fkey", fullName: "FullNamed", availableRoomsId: "123")))
}
