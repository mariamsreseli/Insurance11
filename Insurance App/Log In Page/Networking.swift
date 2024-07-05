//
//  Networking.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/5/24.
//

import Foundation
 
class NetworkService {
    static let shared = NetworkService()
 
    func request<Request: Codable, Response: Codable>(
        urlString: String,
        method: String,
        body: Request,
        completion: @escaping (Result<Response, NetworkError>) -> Void
    ) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
 
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
 
        do {
            let jsonData = try JSONEncoder().encode(body)
            request.httpBody = jsonData
        } catch {
            completion(.failure(.encodingError))
            return
        }
 
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.otherError(error)))
                return
            }
 
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
 
            do {
                let decodedData = try JSONDecoder().decode(Response.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
 
enum NetworkError: Error {
    case badURL
    case encodingError
    case noData
    case decodingError
    case otherError(Error)
}
