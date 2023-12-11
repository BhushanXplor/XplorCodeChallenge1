//
//  DateView.swift
//  NewRecurringBooking
//
//  Created by Bhushan Gawande on 08/12/23.
//

import SwiftUI

struct DateView: View {
    var title: String
    @Binding var date: Date
    @State var showDatePicker: Bool = false
    
    var body: some View {
        VStack(alignment: .center){
            Text(title)
                .font(.headline)
//                .padding()
            
            HStack () {
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 24, height: 24, alignment: .leading)
                    .padding(.leading, 10)
                
                DatePicker("", selection: $date, displayedComponents: [.date])
                Spacer()
            }
            .frame(width: 180, height: 55)
            .border(.gray.opacity(0.5), width: 2)        
        }
    }
}

#Preview {
    DateView(title: "Date Picker", date: .constant(Date()))
}
