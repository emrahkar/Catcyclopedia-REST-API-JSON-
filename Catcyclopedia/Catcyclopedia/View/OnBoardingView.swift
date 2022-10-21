//
//  OnBoardingView.swift
//  Catcyclopedia
//
//  Created by Emrah Karabulut on 17.10.2022.
//

import SwiftUI

struct OnBoardingView: View {
    
    @State var enterStatus: Bool = false
    
    var body: some View {
     
            ZStack{
                Image("onBoardingCat")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 390, height: 850)
                    .clipped()
                    
    
                
                LinearGradient(colors: [.clear, .black],
                               startPoint: .top,
                               endPoint: .bottom)
                
              
                Button {
                    enterStatus.toggle()
                } label: {
                        Text("Find your cat!")
                            .foregroundColor(Color.MyTheme.customWhite.opacity(0.6))
                            .font(.title3)
                            .fontWeight(.bold)
                            .background(
                                Capsule()
                                    .frame(width: 200, height: 50)
                                    .foregroundColor(Color.MyTheme.skyBlue.opacity(0.6))
                                )
                    }
                    .padding(.top, 640)
                }
                .ignoresSafeArea()
                .overlay{
                    if enterStatus == true {
                        CatListView()
                    }
                }
        }
        
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
