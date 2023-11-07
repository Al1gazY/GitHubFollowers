//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Aligazy Kismetov on 06.11.2023.
//

import Foundation

class NetworkManager{
    
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, ErrorMessages?) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, .invalidUsername)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                
            if let _ = error{
                completed(nil, .unableToComplete)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, .invalidResponce)
                return
            }
            
            guard let data = data else{
                completed(nil, .invalidData)
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch{
                completed(nil, .invalidData)
            }
        }
        
        task.resume()
    }
}
