//
//  CatDataViewModel.swift
//  Catcyclopedia
//
//  Created by Emrah Karabulut on 12.10.2022.
//

import Foundation

class CatDataViewModel: ObservableObject {
    
    @Published var cats = [Cat]()
    @Published var loading: Bool = false
    @Published var errorMsg: String? = nil
    
    let catDataLoader = NetworkingService()
    
    func downloadCatData() {
        
        loading = true
        errorMsg = nil
        
        let url = URL(string: "https://api.thecatapi.com/v1/breeds/?api_key=live_TCClsqkzQNbI0agYOz4rQJjY5yMY8fK83G1i8eyuu2VaoXEnDSeagcqyXX8Tnd8n")
        
        catDataLoader.fetchCatData(url: url) { [weak self] cats, error in
            if let error = error {
                DispatchQueue.main.async {
                    self?.errorMsg = error.localizedDescription
                }
                print(error)
            } else if let cats = cats {
                DispatchQueue.main.async {
                    self?.loading = false
                    self?.cats = cats
                }
            }
        }
    }
}
