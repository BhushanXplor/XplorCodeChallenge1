//
//  Utils.swift
//  NewRecurringBooking
//
//  Created by Bhushan Gawande on 12/12/23.
//

import Foundation

class Utils {
    static let shared = Utils()
    private init() {}
    
    func convertToAmPm(timeString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        guard let date = dateFormatter.date(from: timeString) else {
            return nil
        }
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "ha"
        let formattedTime = dateFormatter.string(from: date)
        return formattedTime
    }
    
}
