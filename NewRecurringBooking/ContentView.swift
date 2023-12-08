//
//  ContentView.swift
//  NewRecurringBooking
//
//  Created by Bhushan Gawande on 08/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedChild: String = ""
    @State private var selectedRoom: String = ""
    
    @State private var childData: [String] = ["John Smith", "Emily Smith"]
    @State private var roomData: [String] = ["Before school care", "Long Day Care"]

    var body: some View {
        NavigationView {
            
            VStack {
                
                VStack {
                    Text("Who's going?")
                        .font(.headline)
                        .padding(.trailing, 180)
                        .padding(.top, 20)
                    
                    ChildListView(childData: $childData, selectedItem: $selectedChild)
                }
                .border(.gray, width: 2)
                .padding()
                
                
                VStack {
                    Text("Choose a room")
                        .font(.headline)
                        .padding(.trailing, 170)
                        .padding(.top, 20)
                    
                    ChildListView(childData: $roomData, selectedItem: $selectedRoom)
                }
                .border(.gray, width: 2)
                .padding()
                
                Button(action: {
                    print("child Name = \(self.selectedChild) && room Name = \(self.selectedRoom)")
                }, label: {
                    Text("Button")
                })
            }.navigationTitle("New Recurring Booking")
            
            
           
        }
    }
    
    
}

#Preview {
    ContentView()
}
