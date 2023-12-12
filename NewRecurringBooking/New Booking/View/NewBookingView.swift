    //
    //  ContentView.swift
    //  NewRecurringBooking
    //
    //  Created by Bhushan Gawande on 08/12/23.
    //

import SwiftUI

enum ViewType: String {
    case child = "Who's going?"
    case room = "Choose a room"
}

struct NewBookingView: View {
    @State private var selectedChildId: String = ""
    @State private var selectedRoom: String = ""
    @State private var birthDate = Date.now
    @State private var navigationPath = NavigationPath()
    @State var startDate = Date()
    @State var endDate = Date()
    @State var selectedDays: [WeakDays] = []
    
    @ObservedObject var viewModel = NewBookingViewModel()
    
    var rows: [GridItem] = Array(repeating: .init(.flexible()), count: 7)
    let layout = [
        GridItem(.adaptive (minimum: 7, maximum: 7))
    ]
    
    var body: some View {
        
        NavigationStack(path: $navigationPath) {
            VStack {
                VStack {
                    ChildListView(title: ViewType.child.rawValue, childData: viewModel.children, selectedChild: $selectedChildId)
                        .onTapGesture {
                            print("selected child id = \(selectedChildId)")
                            viewModel.getRoomsData(id: selectedChildId)
                            selectedRoom = ""
                        }
                    
                    RoomListView(title: ViewType.room.rawValue, roomData: viewModel.rooms, selectedRoom: $selectedRoom)
                }
                
                HStack {
                    Spacer()
                    DateView(dateType: .start,date: $startDate, fromDate: Date())
                    Spacer()
                    DateView(dateType: .end, date: $endDate, fromDate: startDate)
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
                
                Spacer()
                
                HStack(alignment: .center, spacing: 20) {
                    Spacer()
                    Button {
                        print("selected child = \(selectedChildId)")
                        print("selected Room = \(selectedRoom)")
                        print("Start date = \(startDate)")
                        print("end date = \(endDate)")
                        print("Selected Days = \(selectedDays)")                        
                        //navigationPath.append("SummaryView")
                    } label: {
                        Text("Review bookings")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderless)
                    .frame(height: 50)
                    .background(.accent)
                    .font(.headline)
                    .foregroundColor(.white)
                    Spacer()
                }
                
                Spacer()
            }
            .navigationTitle("New recurring booking")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: String.self) { view in
                if view == "SummaryView" {
                    BookingSummaryView()
                }
            }
            .navigationBarBackButtonHidden(true)
            .onAppear(perform: {
                viewModel.getChildrenData()
            })
        }
    }
}

#Preview {
    NewBookingView()
}
