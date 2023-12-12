//
//  NewBookiingModel.swift
//  NewRecurringBooking
//
//  Created by Bhushan Gawande on 12/12/23.
//

import Foundation

struct ChildrenModel: Decodable {
    let data : ChildrenData
    let id : String
    let displayName : String
    let version : Int
}

struct ChildrenData: Decodable {
    let children: [ChildrenResponse]
}

struct ChildrenResponse : Decodable, Hashable {
    let age : Int
    let fkey : String
    let fullName : String
    var availableRoomsId : String
}


//Rooms
struct RoomModel: Decodable {
    let data : RoomData
    let id : String
    let displayName : String
    let version : Int
}

struct RoomData: Decodable {
    let bookingRooms: [RoomResponse]
}

struct RoomResponse: Decodable {
    let fee : String
    let endTime : String
    let feeFkey : String
    let roomFkey : String
    let roomName : String
    let startTime : String
}





