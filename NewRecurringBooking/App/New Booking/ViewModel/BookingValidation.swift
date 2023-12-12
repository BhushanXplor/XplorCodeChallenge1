//
//  BookingValidation.swift
//  NewRecurringBooking
//
//  Created by Bhushan Gawande on 12/12/23.
//

import Foundation

struct BookingValidation {
    static func validateBookingData(data: BookingDataModel) -> Bool {
        return data.selectedChildDetails != nil && data.selectedRoomDetails != nil && !data.selectedDays.isEmpty
    }
}


