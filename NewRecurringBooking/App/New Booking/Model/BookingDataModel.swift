//
//  BookingDataModel.swift
//  NewRecurringBooking
//
//  Created by Bhushan Gawande on 13/12/23.
//

import Foundation

struct BookingDataModel {
    var errorMessage: String = String()
    var isPresentingErrorAlert: Bool = false
    var showChildProgressView: Bool = false
    var showRoomProgressView: Bool = false
    
    var startDate = Date()
    var endDate = Date()
    var selectedDays: [WeakDays] = []
    var selectedChildDetails: ChildrenResponse?
    var selectedRoomDetails: RoomResponse?
}
