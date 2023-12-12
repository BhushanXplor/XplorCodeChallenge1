    //
    //  NewBookingViewModel.swift
    //  NewRecurringBooking
    //
    //  Created by Bhushan Gawande on 12/12/23.
    //

import Foundation
import Combine


struct APIEndpoint {
    static let BaseURL = "https://api.myjson.online/v1/records/"
    static let getChild = "076c0cb9-c60e-48eb-a447-77e85b700d94"
    static let token = "66e627a5-cfff-4a8e-b80f-6f0e572bf476"
}

class NewBookingViewModel: ObservableObject {
    @Published var children: [ChildrenResponse] = []
    @Published var rooms: [RoomResponse] = []
    
    @Published var showChildProgressView: Bool = false
    @Published var showRoomProgressView: Bool = false

    private var cancellables = Set<AnyCancellable>()
    
    init() {
    }
    
    func getChildrenData() {
        showChildProgressView = true
        NetworkManager.shared.get(id: APIEndpoint.getChild, type: ChildrenModel.self) { result, error in
            print("getChildrenData error = \(String(describing: error))")
            self.showChildProgressView = false

            if error == nil && result != nil {
                if let data = result {
                    if let data = data.data.children as? [ChildrenResponse] {
                        self.children = data
                    }
                }
            }
        }
    }
    
    func getRoomsData(id: String) {
        showRoomProgressView = true

        NetworkManager.shared.get(id: id, type: RoomModel.self) { result, error in
            print("getRoomsData error = \(String(describing: error))")
            self.showRoomProgressView = false

            if error == nil && result != nil {
                if let data = result {
                    if let data = data.data.bookingRooms as? [RoomResponse] {
                        self.rooms = data
                    }
                }
            }
        }
    }
    
}
