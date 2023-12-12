    //
    //  BookingSummaryView.swift
    //  NewRecurringBooking
    //
    //  Created by Bhushan Gawande on 11/12/23.
    //

import SwiftUI

struct BookingSummaryView: View {
    
    let bookingData: BookingDataModel
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading, spacing: 10){
                HStack {
                    Text("Summary")
                        .font(.headline)
                        .padding()
                    
                    Spacer()
                }
                
                HStack () {
                    Image(systemName: "person.circle.fill")
                        .padding(.leading, 10)
                    
                    Text(bookingData.selectedChildDetails?.fullName ?? "Child Name")
                        .font(.headline)
                        .frame(alignment: .leading)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .border(.gray.opacity(0.5), width: 2)
                .padding(.leading, 20)
                
                VStack (alignment: .leading, spacing: 2.0) {
                    let roomDetails = getlabelValue(bookingData.selectedRoomDetails)
                    
                    Text(roomDetails)
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    
                    Text("from \(Utils.shared.getDate(bookingData.startDate))")
                    
                    let days = bookingData.selectedDays.map{ $0.rawValue }
                    let daysValue = (days.count == 7) ? "Everyday" : "Every \(days.joined(separator: ", "))"
                    
                    Text(daysValue)
                    Text("Ends \(Utils.shared.getDate(bookingData.endDate))")
                    
                    let diffInDays = Calendar.current.dateComponents([.day], from: bookingData.startDate, to: bookingData.endDate).day
                    
                    Text("You are booking \(getTotalDays()) days")
                        .padding(.top)
                        .padding(.leading, 0)
                    
                    Text("Booking Reference Number:")
                        .font(.headline)
                        .padding(.top)
                    
                    let id = bookingData.selectedChildDetails?.availableRoomsId ?? UUID().uuidString
                    Text(id)
                }
                .padding()
                
                Spacer()
                
                VStack(alignment: .center, spacing: 20) {
                    
                    Button {
                        dismiss()
                        
                    } label: {
                        Text("Change booking")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderless)
                    .frame(height: 50)
                    .border(.accent)
                    .font(.headline)
                    
                    Button {
                            //MARK: done button actiom
                    } label: {
                        Text("DONE")
                            .frame(maxWidth: .infinity)
                        
                    }
                    .buttonStyle(.borderless)
                    .frame(height: 50)
                    .background(.accent)
                    .font(.headline)
                    .foregroundColor(.white)
                    
                }
                .padding(10)
            }
            .padding()
        }.padding(.top, 50)
            .navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea([.top])
    }
    
    func getlabelValue(_ item: RoomResponse?) -> String {
        let fromdate = Utils.shared.convertToAmPm(timeString: (item?.startTime ?? "")) ?? ""
        let toDate = Utils.shared.convertToAmPm(timeString: (item?.endTime ?? "")) ?? ""
        let value = (item?.roomName ?? "") + " - " + "\(fromdate)"  + " - \(toDate)"
        return value
    }
    
    func getTotalDays() -> Int {
        let dateInterval: DateInterval = .init(start: bookingData.startDate, end: bookingData.endDate)
        var alldays: [WeakDays] = [.Sat, .Sun, .Mon, .Tues, .Wed, .Thu, .Fri]
        var totalDays = 0
        
        for item in bookingData.selectedDays {
            let index = alldays.firstIndex(of: item)
            let day = dateInterval.dates(matching: .init(weekday: index))
            totalDays =  totalDays + day.count
        }
        
        return totalDays
    }
}

#Preview {
    BookingSummaryView(bookingData: BookingDataModel())
}
