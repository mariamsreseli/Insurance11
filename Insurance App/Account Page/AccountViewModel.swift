//
//  AccountViewModel.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/5/24.
//

//import Foundation
//
//class NetworkManager: ObservableObject {
//    @Published var userProfile: UserProfile?
//
//    func fetchUserProfile() {
//        guard let url = URL(string: "http://localhost:8000/api/user/profile/") else { return }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.setValue("Bearer your_token_here", forHTTPHeaderField: "Authorization")
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                do {
//                    let userProfile = try JSONDecoder().decode(UserProfile.self, from: data)
//                    DispatchQueue.main.async {
//                        self.userProfile = userProfile
//                    }
//                } catch {
//                    print("Error decoding user profile data: \(error)")
//                }
//            } else if let error = error {
//                print("Error fetching user profile data: \(error)")
//            }
//        }.resume()
//    }
//}

import Foundation

struct APIClient {
    static let baseURL = "https://your-api-base-url.com"
    
    static func getUserData(accessToken: String, completion: @escaping (Result<UserData, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/api/user/profile/") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                do {
                    let userData = try JSONDecoder().decode(UserData.self, from: data)
                    completion(.success(userData))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
