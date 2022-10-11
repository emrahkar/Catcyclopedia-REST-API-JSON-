//
//  NetworkingManager.swift
//  Catcyclopedia
//
//  Created by Emrah Karabulut on 11.10.2022.
//

import Foundation

struct NetworkingService {
    
    func fetchCatData(url: URL?, completionHandler: @escaping(_ cats: [Cat]?, _ error: NetworkingError?) ->()) {
        
        guard let url = url else{
            let error = NetworkingError.badURL
            completionHandler(nil, error)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error as? URLError {
                completionHandler(nil, NetworkingError.badURL)
            } else if let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 {
                completionHandler(nil, NetworkingError.badURLResponse(url: url))
            } else if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let cats = try decoder.decode([Cat].self, from: data)
                    completionHandler(cats, nil)
                } catch  {
                    completionHandler(nil, NetworkingError.unknown)
                }
            }
        }
        task.resume()
    }
    
}
