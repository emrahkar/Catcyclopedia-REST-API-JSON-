//
//  CatRowView.swift
//  Catcyclopedia
//
//  Created by Emrah Karabulut on 12.10.2022.
//

import SwiftUI

struct CatRowView: View {
    
    let urlString: String
    let cat: Cat
    
    var body: some View {
        
        VStack(spacing: 10){
            
            CatImageView(urlString: urlString)
                .padding(.bottom, 2)
            VStack(alignment: .leading) {
                Text(cat.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.MyTheme.customWhite)
                Text(cat.temperament)
                    .font(.caption)
                    .foregroundColor(Color.MyTheme.customWhite)
                    .multilineTextAlignment(.leading)
            }
            .padding(.horizontal, 2)
            
            Spacer()
        }
        .frame(width: 300, height: 500)
        .background(Color.MyTheme.skyBlue)
        .cornerRadius(20)
       
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 2)
        )
        .shadow(color: Color.gray, radius: 15, x: 2, y: -2)

        
    }
}

struct CatRowView_Previews: PreviewProvider {
    static var previews: some View {
        CatRowView(urlString: "https://cdn2.thecatapi.com/images/ozEvzdVM-.jpg", cat: Cat.cat1)
    }
}
