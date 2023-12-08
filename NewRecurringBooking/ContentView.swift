//
//  ContentView.swift
//  NewRecurringBooking
//
//  Created by Bhushan Gawande on 08/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            NavigationView {
                VStack {
                   
                    Text("Who's Going?")
                        .bold()
                        .padding()
                    Spacer()
                }
                .navigationTitle("New Recurring Booking")
                .fontWeight(.light)
                
            }
        }
}

#Preview {
    ContentView()
}
