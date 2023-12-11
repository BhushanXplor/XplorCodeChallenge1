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
    
    @State private var birthDate = Date.now
    
    var childData: [String] = ["John Smith", "Emily Smith"]
    var roomData: [String] = ["Before school care", "Long Day Care"]
    
    @State var startDate = Date()
    @State var endDate = Date()
    
    var rows: [GridItem] = Array(repeating: .init(.flexible()), count: 7)
    @State  var selectedDays: [WeakDays] = []
    
    let layout = [
        GridItem(.adaptive (minimum: 7, maximum: 7))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    DetailListView(title: "Who's going?", childData: childData, selectedChild: $selectedChild)
                    
                    DetailListView(title: "Choose a room", childData: roomData, selectedChild: $selectedRoom)
                }
                
                HStack {
                    Spacer()
                    DateView(title: "Start date", date: $startDate)
                    Spacer()
                    DateView(title: "End date", date: $endDate)
                    Spacer()
                    
                }
                .padding(.leading, 50)
                .padding(.trailing, 50)
                
                Spacer()
                
                VStack(spacing: -30) {
                    Text("Choose days")
                        .font(.headline)
                        .padding(-20)
                    
                    LazyVGrid(columns: rows, spacing: 20,content: {
                        ForEach(WeakDays.allCases, id: \.self) { item in
                            WeakDaysView(item: item, items: $selectedDays)
                        }
                    })
                    .padding(40)
                }
                
                Button(action: {
                    print("child Name = \(self.selectedChild) && room Name = \(self.selectedRoom) Start Date = \(startDate) && end date = \(endDate)")
                    
                    print("selected days = \(selectedDays)")
                }, label: {
                    Text("Review Bookings")
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
            }.navigationTitle("New Recurring Booking")
        }
    }
    
}

#Preview {
    ContentView()
}
