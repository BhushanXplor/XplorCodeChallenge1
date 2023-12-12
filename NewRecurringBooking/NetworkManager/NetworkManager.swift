//
//  NetworkManager.swift
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

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {
        
    }
    
    private var cancellables = Set<AnyCancellable>()
    private let baseURL = "https://api.myjson.online/v1/records"
    private let token = "66e627a5-cfff-4a8e-b80f-6f0e572bf476"

    func get<T: Decodable>(id: String, type: T.Type, completion: @escaping(_ result: T?, _ error: Error?)  -> Void ) {
        guard let url = URL(string: self.baseURL.appending("/\(id )")) else {
            completion(nil, NetworkError.invalidURL)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(APIEndpoint.token, forHTTPHeaderField: "x-collection-access-token")
        
        URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .sink { response in
                
                switch response {
                    case .failure(let error):
                        print("finished failure = \(error)")
                        completion(nil, NetworkError.responseError)

                    case .finished:
                        print("finished Success")
                }
                
            } receiveValue: { data in
                completion(data, nil)
            }
            .store(in: &cancellables)
    }
}

enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .invalidURL:
                return NSLocalizedString("Invalid URL", comment: "Invalid URL")
            case .responseError:
                return NSLocalizedString("Unexpected status code", comment: "Invalid response")
            case .unknown:
                return NSLocalizedString("Unknown error", comment: "Unknown error")
        }
    }
}
