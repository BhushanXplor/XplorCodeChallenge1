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
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
    }
    
    func getChildrenData() {
        guard let url = URL(string: APIEndpoint.BaseURL + APIEndpoint.getChild) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(APIEndpoint.token, forHTTPHeaderField: "x-collection-access-token")
        
        URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: ChildrenModel.self, decoder: JSONDecoder())
            .sink { [weak self] response in
                
                switch response {
                    case .failure(let error):
                        print("finished failure = \(error)")

                    case .finished:
                        print("finished Success")
                }
                
            } receiveValue: { [weak self] bookingData in
                
                if let data = bookingData.data.children as? [ChildrenResponse] {
                    self?.children = data
                    print("data = \(data)")
                    
                    data.forEach { item in
                        print("item = \(item)")
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    func getRoomsData(id: String) {
        guard let url = URL(string: APIEndpoint.BaseURL + id) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(APIEndpoint.token, forHTTPHeaderField: "x-collection-access-token")
        
        URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: RoomModel.self, decoder: JSONDecoder())
            .sink { [weak self] response in
                
                switch response {
                    case .failure(let error):
                        print("finished failure = \(error)")

                    case .finished:
                        print("finished Success")
                }
                
            } receiveValue: { [weak self] bookingData in
                
                if let data = bookingData.data.bookingRooms as? [RoomResponse] {
                    self?.rooms = data
                }
            }
            .store(in: &cancellables)
    }
    
}
