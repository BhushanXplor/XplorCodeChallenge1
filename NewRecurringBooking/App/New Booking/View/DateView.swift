    //
    //  DateView.swift
    //  NewRecurringBooking
    //
    //  Created by Bhushan Gawande on 08/12/23.
    //

import SwiftUI

enum DayType: String {
    case start = "Start Date"
    case end = "End Date"
}

struct DateView: View {
    var dateType: DayType
    @Binding var date: Date
    var fromDate: Date
    
    var body: some View {
        VStack(alignment: .center){
            Text(dateType.rawValue)
                .font(.headline)
            
            HStack () {
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 24, height: 24, alignment: .leading)
                    .padding(.leading, 10)
                
                DatePicker("", selection: $date, in: fromDate... ,displayedComponents: [.date])
                    .padding(.leading, -20)                
                Spacer()
            }
            .frame(width: 180, height: 55)
            .border(.gray.opacity(0.5), width: 2)
        }
    }
}

#Preview {
    DateView(dateType: .start ,date: .constant(Date()), fromDate: Date())
}
