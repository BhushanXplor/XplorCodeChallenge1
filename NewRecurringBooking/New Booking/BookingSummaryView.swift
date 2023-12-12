    //
    //  BookingSummaryView.swift
    //  NewRecurringBooking
    //
    //  Created by Bhushan Gawande on 11/12/23.
    //

import SwiftUI

struct BookingSummaryView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading, spacing: 10){
                HStack {
                    Text("Summary")
                        .font(.headline)
                        .padding()
                    
                    Spacer()
                }
                
                HStack () {
                    Image(systemName: "person.circle.fill")
                        .padding(.leading, 10)
                    
                    Text("Child Name")
                        .font(.headline)
                        .frame(alignment: .leading)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .border(.gray.opacity(0.5), width: 2)
                .padding(.leading, 20)
                
                VStack (alignment: .leading, spacing: 2.0) {
                    Text("Before school care - 5am - 8:30am")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    
                    Text("from 2 Jan 2023")
                    
                    Text("Every Mon, Tue, Wed")
                    Text("Ends 20 Dec 2025")
                    
                    Text("You are booking 156 days")
                        .padding(.top)
                        .padding(.leading, 0)
                    
                    Text("Booking Reference Number")
                        .font(.headline)
                        .padding(.top)
                    Text("8b3a437d-ed3e-485a-8130-b6a416d87")
                }
                .padding()
                
                Spacer()
                
                VStack(alignment: .center, spacing: 20) {
                    
                    Button {
                        dismiss()
                        
                    } label: {
                        Text("Change booking")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderless)
                    .frame(height: 50)
                    .border(.accent)
                    .font(.headline)
                    
                    Button {
                        //MARK: done button actiom
                    } label: {
                        Text("DONE")
                            .frame(maxWidth: .infinity)

                    }
                    .buttonStyle(.borderless)
                    .frame(height: 50)
                    .background(.accent)
                    .font(.headline)
                    .foregroundColor(.white)

                }
                .padding(10)
            }
            .padding()
        }.padding(.top, 50)
            .navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea([.top])
    }
}

#Preview {
    BookingSummaryView()
}
