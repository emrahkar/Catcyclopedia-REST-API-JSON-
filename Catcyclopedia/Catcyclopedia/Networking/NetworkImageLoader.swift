//
//  NetworkImageLoader.swift
//  Catcyclopedia
//
//  Created by Emrah Karabulut on 12.10.2022.
//

import Foundation
import SwiftUI

class NetworkingImageLoader{

    func loadCatImage(url: URL?, completionHandler: @escaping(_ image: UIImage?, _ error: NetworkingError?) -> ()) {

        guard let url = url else {
            let error = NetworkingError.badURL
            completionHandler(nil, error)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error as? URLError {
                completionHandler(nil, NetworkingError.badURL)
                print(error)
            } else if let response = response as? HTTPURLResponse, !(response.statusCode >= 200 && response.statusCode < 300) {
                completionHandler(nil, NetworkingError.badURLResponse(url: url))
                print(response.statusCode)
            } else if let data = data, let image = UIImage(data: data) {
                completionHandler(image, nil)
            }
        }
        task.resume()
    }
}
