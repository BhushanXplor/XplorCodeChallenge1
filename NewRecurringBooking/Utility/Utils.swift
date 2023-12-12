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
    
    func getDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyy"
        return dateFormatter.string(from: date)
    }
}

extension DateInterval {
    func dates(matching components: DateComponents) -> [Date] {
        var start = self.start
        var dates: [Date] = []
        while let date = Calendar.current.nextDate(after: start, matching: components, matchingPolicy: .strict), date <= end {
            dates.append(date)
            start = date
        }
        return dates
    }
}
