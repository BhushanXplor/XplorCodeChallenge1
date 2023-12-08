//
//  DatePickerView.swift
//  NewRecurringBooking
//
//  Created by Bhushan Gawande on 08/12/23.
//

import SwiftUI

struct DatePickerView: View {
    @State private var birthDate = Date.now

    var body: some View {
            VStack {
                DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
                    Text("Select a date")
                }

                Text("Date is \(birthDate.formatted(date: .long, time: .omitted))")
            }
        }
}

#Preview {
    DatePickerView()
}
