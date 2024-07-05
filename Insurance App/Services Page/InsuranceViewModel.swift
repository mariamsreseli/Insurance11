//
//  InsuranceViewModel.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/5/24.
//

import Foundation
import Combine

class InsuranceViewModel: ObservableObject {
    @Published var insurances: [Insurance] = []
    @Published var errorMessage: String?

    func fetchInsurances() {
        guard let url = URL(string: "http://localhost:8000/api/insurances/") else {
            self.errorMessage = "Invalid URL"
            return
        }

        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.errorMessage = "No data received"
                }
                return
            }
            
            do {
                let insurances = try JSONDecoder().decode([Insurance].self, from: data)
                DispatchQueue.main.async {
                    self.insurances = insurances
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }.resume()
    }
}
