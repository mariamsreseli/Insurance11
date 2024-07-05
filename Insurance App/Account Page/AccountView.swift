//
//  AccountView.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/4/24.
//

import SwiftUI

struct AccountView: View {
    let user: User = User(id: 1, username: "johndoe", email: "john.doe@example.com", firstName: "John", lastName: "Doe", phoneNumber: "123-456-7890", personalNumber: "ABC123")
    let userProfile: UserProfile = UserProfile(id: 1, user: User(id: 1, username: "johndoe", email: "john.doe@example.com", firstName: "John", lastName: "Doe", phoneNumber: "123-456-7890", personalNumber: "ABC123"), balance: "1000", insurance: [Insurance(id: 1, name: "Health Insurance", price: "$50/month", timePeriod: "1 year")])
    
    var body: some View {
        List {
            Section {
                HStack {
                    Image("Logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.fullName)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 14)
                        
                        Text(user.email)
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        Text(user.phoneNumber)
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        Text(user.personalNumber)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Section(header: Text("Services")) {
                Text("Balance: \(userProfile.balance)")
                
                ForEach(userProfile.insurance) { insurance in
                    VStack(alignment: .leading) {
                        Text(insurance.name)
                            .font(.headline)
                        Text("Price: \(insurance.price)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("Period: \(insurance.timePeriod)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                
            }
            
            Section(header: Text("Come back soon")) {
                Button(action: {
                    print("Sign out..")
                }) {
                    SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                }
                
                Button(action: {
                    print("Delete account..")
                }) {
                    SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                }
            }
        }
    }
        
    }


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

#Preview {
    AccountView()
}

//import SwiftUI
//
//struct AccountView: View {
//    @StateObject private var networkManager = NetworkManager()
//    
//    var body: some View {
//        List {
//            if let userProfile = networkManager.userProfile {
//                Section {
//                    HStack {
//                        Text(userProfile.user.initials)
//                            .font(.title)
//                            .fontWeight(.semibold)
//                            .foregroundStyle(Color.white)
//                            .frame(width: 72, height: 72)
//                            .background(Color.gray)
//                            .clipShape(Circle())
//                        
//                        VStack(alignment: .leading, spacing: 4) {
//                            Text(userProfile.user.fullName)
//                                .font(.subheadline)
//                                .fontWeight(.semibold)
//                                .padding(.top, 14)
//                            
//                            Text(userProfile.user.email)
//                                .font(.footnote)
//                                .accentColor(.gray)
//                            
//                            Text(userProfile.user.phoneNumber)
//                                .font(.footnote)
//                                .accentColor(.gray)
//                            
//                            Text(userProfile.user.personalNumber)
//                                .font(.footnote)
//                                .accentColor(.gray)
//                        }
//                    }
//                }
//                
//                Section("Account") {
//                    Button {
//                        print("Sign out..")
//                    } label: {
//                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
//                    }
//                    
//                    Button {
//                        print("Delete account..")
//                    } label: {
//                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
//                    }
//                }
//            }
//        }
//        .onAppear {
//            networkManager.fetchUserProfile()
//        }
//    }
//}
//
//struct SettingsRowView: View {
//    let imageName: String
//    let title: String
//    let tintColor: Color
//    
//    var body: some View {
//        HStack(spacing: 12) {
//            Image(systemName: imageName)
//                .imageScale(.small)
//                .font(.title)
//                .foregroundStyle(tintColor)
//            
//            Text(title)
//                .font(.subheadline)
//                .foregroundStyle(Color.black)
//        }
//    }
//}
//
//#Preview {
//    AccountView()
//}
//

//import SwiftUI
//
//struct AccountView: View {
//    @Binding var isLoggedIn: Bool
//    @AppStorage("accessToken") private var accessToken: String = ""
//    @State private var userData: UserData?
//
//    var body: some View {
//        VStack {
//            if let userData = userData {
//                Text("Username: \(userData.username)")
//                Text("Email: \(userData.email)")
//                Text("First Name: \(userData.firstName)")
//                Text("Last Name: \(userData.lastName)")
//                Text("Phone Number: \(userData.phoneNumber)")
//                Text("Balance: \(userData.balance)")
//                // Display insurance services and refunds here
//            } else {
//                ProgressView()
//            }
//        }
//        .onAppear {
//            fetchUserData()
//        }
//    }
//
//    private func fetchUserData() {
//        APIClient.getUserData(accessToken: accessToken) { result in
//            switch result {
//            case .success(let userData):
//                self.userData = userData
//            case .failure(let error):
//                print("Error fetching user data: \(error.localizedDescription)")
//                // Handle error or show an alert
//            }
//        }
//    }
//}
//
//struct UserData: Codable {
//    let username: String
//    let email: String
//    let firstName: String
//    let lastName: String
//    let phoneNumber: String
//    let balance: Double
//    // Add more properties for insurance services and refunds
//}
