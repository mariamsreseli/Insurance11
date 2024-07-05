//
//  SignUpViewModel.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/5/24.
//

import Foundation
import Combine
 
class SignupViewModel: ObservableObject {
    @Published var email = ""
    @Published var full_name = ""
    @Published var phone_number = ""
    @Published var personal_number = ""
    @Published var username = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var errorMessage = ""
    @Published var showError = false
    @Published var isSignedUp = false
 
    func signupUser() {
        guard password == confirmPassword else {
            self.errorMessage = "Passwords do not match"
            self.showError = true
            return
        }
 
        let credentials = SignupCredentials(
            username: username,
            email: email,
            full_name: full_name,
            password: password,
            personal_number: personal_number,
            phone_number: phone_number
        )
 
        NetworkService.shared.request(
            urlString: "http://localhost:8000/api/auth/register/",
            method: "POST",
            body: credentials
        ) { (result: Result<SignupResponse, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    print("User signed up successfully: \(response)")
                    self.isSignedUp = true
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print("\(error)")
                    self.showError = true
                }
            }
        }
    }
}


