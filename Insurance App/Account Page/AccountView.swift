//
//  AccountView.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/4/24.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        List {
            Section {
                HStack {
                    Text("MS")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                        .frame(width: 72, height: 72)
                        .background(Color.gray)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Mariam Sreseli")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 14)
                        
                        Text("mariamsreseli@gmail.com")
                            .font(.footnote)
                            .accentColor(.gray)
                        
                        Text("599 123 456")
                            .font(.footnote)
                            .accentColor(.gray)
                        
                        Text("12345678901")
                            .font(.footnote)
                            .accentColor(.gray)
                    }
                    
                }
            }
            
            Section("Account") {
                Button {
                    print("Sign out..")
                } label: {
                    SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                }
                
                Button {
                    print("Delete account..")
                } label: {
                    SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                }
            }
        }
    }
}

#Preview {
    AccountView()
}
