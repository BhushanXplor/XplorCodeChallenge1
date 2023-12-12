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
    @State private var navigationPath = NavigationPath()
    @ObservedObject var viewModel = NewBookingViewModel()
    
    @State private var isPageone = false
    
    var rows: [GridItem] = Array(repeating: .init(.flexible()), count: 7)
    let layout = [
        GridItem(.adaptive (minimum: 7, maximum: 7))
    ]
    
    var body: some View {
        
        NavigationStack(path: $navigationPath) {
            VStack {
                VStack {
                    ZStack {
                        VStack {
                            ChildListView(title: ViewType.child.rawValue, childData: viewModel.children, selectedChild: $viewModel.bookingDataModel.selectedChildDetails)
                                .onTapGesture {
                                    if let id = viewModel.bookingDataModel.selectedChildDetails?.availableRoomsId as? String {
                                        viewModel.getRoomsData(id: id)
                                    }
                                    
                                    viewModel.rooms.removeAll()
                                    viewModel.bookingDataModel.selectedRoomDetails = nil
                                }
                        }
                        
                        LoaderView(showingAlert: $viewModel.bookingDataModel.showChildProgressView)
                    }
                    
                    ZStack {
                        VStack {
                            RoomListView(title: ViewType.room.rawValue, roomData: viewModel.rooms, selectedRoom: $viewModel.bookingDataModel.selectedRoomDetails)
                        }
                        
                        LoaderView(showingAlert: $viewModel.bookingDataModel.showRoomProgressView)
                    }
                }
                
                HStack {
                    Spacer()
                    DateView(dateType: .start,date: $viewModel.bookingDataModel.startDate, fromDate: Date())
                    Spacer()
                    DateView(dateType: .end, date: $viewModel.bookingDataModel.endDate, fromDate: viewModel.bookingDataModel.startDate)
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
                            WeakDaysView(item: item, items: $viewModel.bookingDataModel.selectedDays)
                        }
                    })
                    .padding(40)
                }
                
                Spacer()
                
                HStack(alignment: .center, spacing: 20) {
                    Spacer()
                    Button {
                        isPageone.toggle()
                    } label: {
                        Text("Review bookings")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderless)
                    .frame(height: 50)
                    .font(.headline)
                    .foregroundColor(.white)
                    .disabled(!BookingValidation.validateBookingData(data: viewModel.bookingDataModel))
                    .background(BookingValidation.validateBookingData(data: viewModel.bookingDataModel) ? .accent : .gray)
                    .alert(isPresented: $viewModel.bookingDataModel.isPresentingErrorAlert, content: {
                        Alert(title: Text("Alert"), message: Text(viewModel.bookingDataModel.errorMessage), dismissButton: .cancel(Text("Ok")))
                    })
                    .navigationDestination(
                        isPresented: $isPageone) {
                            BookingSummaryView(bookingData: viewModel.bookingDataModel)
                            Text("")
                                .hidden()
                        }
                    Spacer()
                }
                
                Spacer()
            }
            .navigationTitle("New recurring booking")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: String.self) { view in
                if view == "SummaryView" {
                    BookingSummaryView(bookingData: BookingDataModel())
                }
            }
            .navigationBarBackButtonHidden(true)
            .onAppear(perform: {
                viewModel.getChildrenData()
            })
            .alert(isPresented: $viewModel.bookingDataModel.isPresentingErrorAlert, content: {
                Alert(title: Text("Alert"), message: Text(viewModel.bookingDataModel.errorMessage), dismissButton: .cancel(Text("Ok")))
            })
        }
    }
}

#Preview {
    NewBookingView()
}
