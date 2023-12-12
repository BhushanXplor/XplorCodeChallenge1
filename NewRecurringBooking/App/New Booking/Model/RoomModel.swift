//
//  RoomModel.swift
//  NewRecurringBooking
//
//  Created by Bhushan Gawande on 12/12/23.
//

import Foundation
struct RoomModel: Decodable {
    let data : RoomData
    let id : String
    let displayName : String
    let version : Int
}

struct RoomData: Decodable {
    let bookingRooms: [RoomResponse]
}

struct RoomResponse: Decodable, Identifiable {
    private enum CodingKeys: CodingKey {
        case fee
        case endTime
        case feeFkey
        case roomFkey
        case roomName
        case startTime
    }
    
    public var id = UUID()
    let fee : String
    let endTime : String
    let feeFkey : String
    let roomFkey : String
    let roomName : String
    let startTime : String
}
