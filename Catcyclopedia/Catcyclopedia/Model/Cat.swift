//
//  Cat.swift
//  Catcyclopedia
//
//  Created by Emrah Karabulut on 11.10.2022.
//

import Foundation


struct Cat: Codable, Identifiable {
    
    let id: String
    let name: String
    let temperament: String
    let origin: String
    let description: String
    let weight: String
    let childFriendly: Int
    let dogFriendly: Int
    let energyLevel: Int
    let catImage: CatImage?
    
    
    enum codingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case origin
        case description
        case weight = "weight_imperial"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
    }
    
}
