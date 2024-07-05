//
//  LogInViewModel.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/5/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var errorMessage: String?
    @Published var isLoggedIn = true

    func loginUser() {
        let credentials = UserCredentials(username: username, password: password)
        NetworkService.shared.request(urlString: "http://localhost:8000/api/auth/login/", method: "POST", body: credentials) { (result: Result<LoginResponse, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    print("Access Token: \(response.access)")
                    print("Refresh Token: \(response.refresh)")
                    self.isLoggedIn = true
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
