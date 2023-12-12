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
    @Binding var selectedRoom: RoomResponse?
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding(.trailing, 210)
                .padding(.top, 20)
            List {
                ForEach(roomData, id:\.id) { item in
                    HStack {
                        Group{
                            HStack {
                                if item.id == selectedRoom?.id {
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
                        
                        Text(getlabelValue(item))
                            .font(.system(size: 16))
                            .foregroundColor(item.id ==  selectedRoom?.id ? .blue : .black)

                    }
                    .onTapGesture {
                        print("tap on \( $selectedRoom)")
                        selectedRoom = item
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
    RoomListView(title: "Choose room", roomData: [RoomResponse(fee: "AP", endTime: "6pm", feeFkey: "", roomFkey: "Key", roomName: "Room Name", startTime: "5am")], selectedRoom: .constant(RoomResponse( fee: "AP", endTime: "6pm", feeFkey: "", roomFkey: "Key", roomName: "Room Name", startTime: "5am")))
}
