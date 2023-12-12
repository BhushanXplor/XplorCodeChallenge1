//
//  RoomListView.swift
//  NewRecurringBooking
//
//  Created by Bhushan Gawande on 12/12/23.
//

import SwiftUI

struct RoomListView: View {
    var title: String
    var roomData: [RoomResponse]
    @Binding var selectedRoom: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding(.trailing, 210)
                .padding(.top, 20)
            List {
                ForEach(roomData, id:\.id) { item in
                    HStack {
                        RadioButton(id: item.roomName, selectedId: $selectedRoom)
                        Text(getlabelValue(item))
                            .font(.system(size: 16))
                    }
                    .onTapGesture {
                        print("tap on \( $selectedRoom)")
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
        
    
    func getlabelValue(_ item: RoomResponse ) -> String{
        let fromdate = Utils.shared.convertToAmPm(timeString: item.startTime) ?? ""
        let toDate = Utils.shared.convertToAmPm(timeString: item.endTime) ?? ""
        let value = item.roomName + " - " + "\(fromdate)"  + " - \(toDate)"
        
        return value
    }
}

#Preview {
    RoomListView(title: "Choose room", roomData: [RoomResponse( fee: "AP", endTime: "6pm", feeFkey: "", roomFkey: "Key", roomName: "Room Name", startTime: "5am")], selectedRoom: .constant("item"))
}
