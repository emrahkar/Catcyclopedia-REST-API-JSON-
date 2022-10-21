//
//  CatDetailedView.swift
//  Catcyclopedia
//
//  Created by Emrah Karabulut on 12.10.2022.
//

import SwiftUI

struct CatDetailedView: View {
    
    let cat: Cat
    
    @State var showSheet: Bool = false
    //@Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
       VStack(spacing: 20) {
          
            CatImageView(urlString: cat.image?.url ?? "https://cdn2.thecatapi.com/images/ozEvzdVM-.jpg")
                .frame(width: 400, height: 400)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(cat.description)
    
                HStack{
                    Text("Origin:")
                        .fontWeight(.bold)
                    Text("\(cat.origin)")
                }
                
                HStack{
                    Text("Life Span:")
                        .fontWeight(.bold)
                    Text("\(cat.lifeSpan) years")
                }
            }
            .foregroundColor(Color.MyTheme.customWhite.opacity(0.7))
            .font(.body)
            .padding(.horizontal, 10)
        
            Spacer()
            
            ZStack{
                Button {
                 
                    showSheet.toggle()
                
                  
                } label: {
                    Text("Click here for more")
                        .foregroundColor(Color.MyTheme.customWhite.opacity(0.7))
                        .fontWeight(.bold)
                        .frame(width: 220, height: 70)
                        .background(
                            Capsule()
                                .foregroundColor(Color.MyTheme.skyBlue.opacity(0.8))
                        
                        )
                        
                }
                .padding(.top, 30)
                //.sheet(isPresented: $showSheet) {
            
                if showSheet {
                    ZStack(alignment: .topTrailing) {
                        
                        VStack(alignment: .leading, spacing: 40){
                            
                            HStack{
                                Text("Child Friendliness  ")
                                    .foregroundColor(Color.MyTheme.customWhite.opacity(0.7))
                                    .font(.title3)
                                    .fontWeight(.bold)
                                ForEach(1...5, id: \.self) { i in
                                    Image(systemName: (i >= cat.childFriendly ? "heart" : "heart.fill"))
                                        .foregroundColor(Color.red)
                                        .font(.title3)
                                }
                            }
                            
                            HStack{
                                Text("Dog Friendliness     ")
                                    .foregroundColor(Color.MyTheme.customWhite.opacity(0.7))
                                    .font(.title3)
                                    .fontWeight(.bold)
                                ForEach(1...5, id: \.self) { i in
                                    Image(systemName: (i >= cat.childFriendly ? "heart" : "heart.fill"))
                                        .foregroundColor(Color.red)
                                        .font(.title3)
                                }
                            }
                            
                            HStack{
                                Text("Energy Level             ")
                                    .foregroundColor(Color.MyTheme.customWhite.opacity(0.7))
                                    .font(.title3)
                                    .fontWeight(.bold)
                                ForEach(1...5, id: \.self) { i in
                                    Image(systemName: (i >= cat.childFriendly ? "bolt" : "bolt.fill"))
                                        .foregroundColor(Color.yellow)
                                        .font(.title2)
                                }
                            }
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(
                            LinearGradient(colors: [Color.MyTheme.darkBlue, Color.MyTheme.pinkLady],
                                           startPoint: .top,
                                           endPoint: .bottom)
                        )
    
                        Button {
                         
                            showSheet.toggle()
                            
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(Color.MyTheme.pinkLady)
                        }
                        .padding(8)
        
            
        
                    }
                    .cornerRadius(30)
                    .transition(.move(edge: .bottom))
                    .animation(Animation.easeOut(duration: 0.75))
                    
                //}}
                }
            }
          Spacer()
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(colors: [Color.MyTheme.darkBlue2, Color.MyTheme.darkBlue],
                           startPoint: .top,
                           endPoint: .bottom)
        
        )
        
    }
}

struct CatDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        CatDetailedView(cat: Cat.cat1)
    }
}
