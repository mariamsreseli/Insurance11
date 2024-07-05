//
//  LogInModel.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/5/24.
//

import Foundation

struct UserCredentials: Codable {
    let username: String
    let password: String
}

struct LoginResponse: Codable {
    let refresh: String
    let access: String
}
