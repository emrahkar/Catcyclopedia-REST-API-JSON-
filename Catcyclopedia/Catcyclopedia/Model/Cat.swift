//
//  Cat.swift
//  Catcyclopedia
//
//  Created by Emrah Karabulut on 11.10.2022.
//

import Foundation



struct Cat: Identifiable, Codable {
    
    let id: String
    let name: String
    let temperament: String
    let origin: String
    let description: String
    let childFriendly:Int
    let dogFriendly: Int
    let energyLevel: Int
    let lifeSpan: String
    let image: CatImage?

    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case origin
        case description
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case lifeSpan = "life_span"
        case image
    }
    
    static var cat1: Cat = Cat(id: "abys", name: "Abyssinian", temperament: "Active, Energetic, Independent, Intelligent, Gentle", origin: "Egypt", description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", childFriendly: 3, dogFriendly: 4, energyLevel: 5, lifeSpan: "14 - 15", image: nil)
    
    static var cat2: Cat = Cat(id: "aege", name: "Aegean", temperament: "Affectionate, Social, Intelligent, Playful, Active", origin: "Greece", description: "Native to the Greek islands known as the Cyclades in the Aegean Sea, these are natural cats, meaning they developed without humans getting involved in their breeding. As a breed, Aegean Cats are rare, although they are numerous on their home islands. They are generally friendly toward people and can be excellent cats for families with children.", childFriendly: 4, dogFriendly: 4, energyLevel: 3, lifeSpan: "9 - 12", image: nil)
    
}
