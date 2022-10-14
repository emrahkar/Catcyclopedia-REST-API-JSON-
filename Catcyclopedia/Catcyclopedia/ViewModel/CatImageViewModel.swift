////
//  CatImageViewModel.swift
//  Catcyclopedia
//
//  Created by Emrah Karabulut on 13.10.2022.
//

import Foundation
import UIKit


class CatImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var errorMsg: String? = nil
    
  
    let catImageLoader = NetworkingImageLoader()
    
    func downloadCatImage(url: URL?) {
        
        guard let url = url else {
            return
        }
        
        catImageLoader.loadCatImage(url: url) {[weak self] image, error in
            if let error = error {
                DispatchQueue.main.async {
                    self?.errorMsg = error.localizedDescription
                }
                print(error)
            } else if let image = image {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
        
    }
    
}
