//
//  LoaderView.swift
//  NewRecurringBooking
//
//  Created by Bhushan Gawande on 12/12/23.
//

import SwiftUI

struct LoaderView: View {
    @Binding var showingAlert: Bool

    var body: some View {
        if showingAlert {
            ProgressView()
        }
    }
}

#Preview {
    LoaderView(showingAlert: .constant(.random()))
}
