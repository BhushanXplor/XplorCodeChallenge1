    //
    //  NewBookingViewModel.swift
    //  NewRecurringBooking
    //
    //  Created by Bhushan Gawande on 12/12/23.
    //

import Foundation
import Combine


class NewBookingViewModel: ObservableObject {
    @Published var children: [ChildrenResponse] = []
    @Published var rooms: [RoomResponse] = []
    @Published var bookingDataModel: BookingDataModel = BookingDataModel()
    @Published var isValidInput: Bool = false
    
    init() {
    }
    
    func getChildrenData() {
        bookingDataModel.showChildProgressView = true
        NetworkManager.shared.get(id: APIEndpoint.getChild, type: ChildrenModel.self) { [weak self] result, error in
            print("getChildrenData error = \(String(describing: error))")
            self?.bookingDataModel.showChildProgressView = false

            if error == nil && result != nil {
                if let data = result {
                    if let data = data.data.children as? [ChildrenResponse] {
                        self?.children = data
                        return
                    }
                }
            }
            
            self?.bookingDataModel.errorMessage = "Failed to get children data"
            self?.bookingDataModel.isPresentingErrorAlert = true
        }
    }
    
    func getRoomsData(id: String) {
        bookingDataModel.showRoomProgressView = true

        NetworkManager.shared.get(id: id, type: RoomModel.self) { [weak self] result, error in
            print("getRoomsData error = \(String(describing: error))")
            self?.bookingDataModel.showRoomProgressView = false

            if error == nil && result != nil {
                if let data = result {
                    if let data = data.data.bookingRooms as? [RoomResponse] {
                        self?.rooms = data
                        return
                    }
                }
            }
            
            self?.bookingDataModel.errorMessage = "Failed to get room data"
            self?.bookingDataModel.isPresentingErrorAlert = true
        }
    }
}
