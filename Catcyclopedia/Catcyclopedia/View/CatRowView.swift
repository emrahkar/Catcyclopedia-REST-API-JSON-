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
        
        VStack(alignment:.leading, spacing: 10){
            
            CatImageView(urlString: urlString)
                .padding(.bottom, 2)
            VStack(alignment: .leading) {
                Text(cat.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.MyTheme.customWhite.opacity(0.7))
                Text(cat.temperament)
                    .font(.caption)
                    .foregroundColor(Color.MyTheme.customWhite.opacity(0.7))
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
        .frame(width: 320, height: 500)
        .background(
            LinearGradient(colors:
                            [Color.black,
                             Color.MyTheme.skyBlue.opacity(0.7)],
                           startPoint: .top,
                           endPoint: .bottom)
        
        
        )
        .cornerRadius(20)
       
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.clear, lineWidth: 2)
        )
        //.shadow(color: Color.gray, radius: 15, x: 2, y: -2)

        
    }
}

struct CatRowView_Previews: PreviewProvider {
    static var previews: some View {
        CatRowView(urlString: "https://cdn2.thecatapi.com/images/ozEvzdVM-.jpg", cat: Cat.cat1)
    }
}
