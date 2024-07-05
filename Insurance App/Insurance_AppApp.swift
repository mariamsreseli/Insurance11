//
//  Insurance_AppApp.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/4/24.
//

import SwiftUI

@main
struct Insurance_AppApp: App {
    @AppStorage("accessToken") private var accessToken = ""
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
}
