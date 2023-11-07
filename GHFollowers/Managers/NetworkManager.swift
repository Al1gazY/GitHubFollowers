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
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, String?) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "Error, Please Try Again")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                
            if let _ = error{
                completed(nil, "Error, Please check your internet connection.")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Error, Invalid responce from the server.")
                return
            }
            
            guard let data = data else{
                completed(nil, "Error, The data was invalid.")
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch{
                completed(nil, "Error, The data was invalid.")
            }
        }
        
        task.resume()
    }
}
