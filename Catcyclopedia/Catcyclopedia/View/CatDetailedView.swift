//
//  CatDetailedView.swift
//  Catcyclopedia
//
//  Created by Emrah Karabulut on 12.10.2022.
//

import SwiftUI

struct CatDetailedView: View {
    
    let cat: Cat
    var body: some View {
   
        CatImageView(urlString: cat.image?.url ?? "")
   
    }
}

struct CatDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        CatDetailedView(cat: Cat.cat1)
    }
}
