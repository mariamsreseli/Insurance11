//
//  TabBarView.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/5/24.
//

import SwiftUI

struct TabBarView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    var body: some View {
        TabView {
            AboutView()
                .tabItem {
                    Image(systemName: "info.circle")
                        .foregroundColor(.green)
                    Text("About")
                }
            
            InsuranceView()
                .tabItem {
                    Image(systemName: "shield")
                    Text("Insurance")
                }

            AccountView(isLoggedIn: $isLoggedIn)
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                        .foregroundStyle(Color.white)
                }
        }
        
    }
}

