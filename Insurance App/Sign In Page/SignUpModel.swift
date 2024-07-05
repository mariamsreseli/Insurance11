//
//  SignUpModel.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/5/24.
//

import Foundation

struct SignupCredentials: Codable {
    let username: String
    let email: String
    let full_name: String
    let password: String
    let personal_number: String
    let phone_number: String
}

struct SignupResponse: Codable {
    let username: String
    let email: String
    let full_name: String
    let personal_number: String
    let phone_number: String
    let password: String
}
