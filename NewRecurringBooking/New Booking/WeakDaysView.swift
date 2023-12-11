    //
    //  WeakDaysView.swift
    //  NewRecurringBooking
    //
    //  Created by Bhushan Gawande on 08/12/23.
    //

import SwiftUI

enum WeakDays: String, CaseIterable, Equatable {
    case Sun
    case Mon
    case Tues
    case Wed
    case Thu
    case Fri
    case Sat
}

struct WeakDaysView: View {
    let item: WeakDays
    @Binding var items: [WeakDays]
    
    var body: some View {
        Button(action: {
            if items.contains(item) {
                items.removeAll { $0 == item}
            } else {
                items.append(item)
            }
        }, label: {
            Text(item.rawValue)
                .tag(item)
                .foregroundColor(items.contains(item) ? .white : .gray)
        })
        .frame(width: 75, height: 35)
        .background(items.contains(item) ? Color.black : Color.white)
        .border(.gray)
        .clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous))
    }
}

#Preview {
    WeakDaysView(item: .Mon, items: .constant([.Sun, .Mon]))
}
