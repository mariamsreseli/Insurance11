//
//  InsuranceModel.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/5/24.
//

import Foundation

struct InsuranceModel: Codable, Identifiable {
    let id: Int
    let name: String
    let price: String
    let time_period: String
}

