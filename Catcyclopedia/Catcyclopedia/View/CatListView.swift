//
//  CatListView.swift
//  Catcyclopedia
//
//  Created by Emrah Karabulut on 12.10.2022.
//

import SwiftUI

struct CatListView: View {
    
    @StateObject var catDataViewModel = CatDataViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                
                Text("Catcyclopedia")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.MyTheme.skyBlue)
                    
                LazyVStack(alignment: .center, spacing: 10) {
                    
                        ForEach(catDataViewModel.cats) {cat in
                            
                            NavigationLink {
                                
                                CatDetailedView(cat: cat)
                            } label: {
                                CatRowView(urlString: cat.image?.url ?? "", cat: cat)
                            }
                        }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.MyTheme.pinkLady)
            .onAppear{
                catDataViewModel.downloadCatData()
        }
        .navigationBarHidden(true)
        }
        
    }
}

struct CatListView_Previews: PreviewProvider {
    static var previews: some View {
        CatListView()
    }
}
