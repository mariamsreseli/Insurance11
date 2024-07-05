//
//  User.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/4/24.
//

//import Foundation
//
//struct User: Identifiable, Codable {
//    let id: String
//    let fullName: String
//    let email: String
//    let phoneNumber: String
//    let personalID: String
//    
//    var initials: String {
//        let formatter = PersonNameComponentsFormatter()
//        if let components = formatter.personNameComponents(from: fullName) {
//            formatter.style = .abbreviated
//            return formatter.string(from: components)
//        }
//        return ""
//    }
//}
//
//extension User {
//    static var MOCK_USER = User(id: NSUUID().uuidString, fullName: "Mariam Sreseli", email: "test@gmail.com", phoneNumber: "555123123", personalID: "0011223344")
//}

import Foundation

struct User: Identifiable, Codable {
    let id: Int
    let username: String
    let email: String
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let personalNumber: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case phoneNumber = "phone_number"
        case personalNumber = "personal_number"
    }
}

struct UserProfile: Identifiable, Codable {
    let id: Int
    let user: User
    let balance: String
    let insurance: [Insurance]
}

struct Insurance: Identifiable, Codable {
    let id: Int
    let name: String
    let price: String
    let timePeriod: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case timePeriod = "time_period"
    }
}
