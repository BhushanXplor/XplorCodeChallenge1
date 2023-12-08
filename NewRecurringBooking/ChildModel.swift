//
//  ChildModel.swift
//  NewRecurringBooking
//
//  Created by Bhushan Gawande on 08/12/23.
//

import Foundation

struct ChildResponse : Codable {
    let data : ChildData?
    let id : String?
    let displayName : String?
    let version : Int?

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case id = "id"
        case displayName = "displayName"
        case version = "version"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(ChildData.self, forKey: .data)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        displayName = try values.decodeIfPresent(String.self, forKey: .displayName)
        version = try values.decodeIfPresent(Int.self, forKey: .version)
    }

}

struct ChildData : Codable {
    let children : [Children]?

    enum CodingKeys: String, CodingKey {
        case children = "children"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        children = try values.decodeIfPresent([Children].self, forKey: .children)
    }
}

struct Children : Codable {
    let age : Int?
    let fkey : String?
    let fullName : String?
    let availableRoomsId : String?

    enum CodingKeys: String, CodingKey {
        case age = "age"
        case fkey = "fkey"
        case fullName = "fullName"
        case availableRoomsId = "availableRoomsId"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        age = try values.decodeIfPresent(Int.self, forKey: .age)
        fkey = try values.decodeIfPresent(String.self, forKey: .fkey)
        fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
        availableRoomsId = try values.decodeIfPresent(String.self, forKey: .availableRoomsId)
    }

}
