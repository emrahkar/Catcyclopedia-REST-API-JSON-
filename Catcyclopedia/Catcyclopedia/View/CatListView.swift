//
//  CatListView.swift
//  Catcyclopedia
//
//  Created by Emrah Karabulut on 12.10.2022.
//

import SwiftUI

struct CatListView: View {
    
    @StateObject var catDataViewModel = CatDataViewModel()
    @State var catSearch: String = ""
    
    var filteredCats: [Cat] {
    
    if catSearch.count == 0 {
            return catDataViewModel.cats
        } else {
            return catDataViewModel.cats.filter {$0.name.lowercased().contains(catSearch.lowercased())}
        }
    }

    var body: some View {
        
        NavigationView {
        
            VStack(alignment: .leading) {
                
                Text("Catcyclopedia...")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.MyTheme.pinkLady.opacity(0.6))
                    .padding(.horizontal, 10)
                    .padding(.top, 10)
                
                HStack {
                    TextField("Find your cat...", text: $catSearch)
                        .padding()
                        .foregroundColor(Color.MyTheme.pinkLady)
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.MyTheme.pinkLady)
                        .padding()
                }
                .frame(width: 370, height: 50)
                .background(
                    
                    Capsule()
                        .foregroundColor(Color.MyTheme.pinkLady.opacity(0.6))
                    //Color.MyTheme.customWhite
                )
                .padding(.horizontal, 5)

                ScrollView(.horizontal) {
        
                        LazyHStack(spacing: 15) {
                            
                                ForEach(filteredCats) {cat in
                                    
                                    NavigationLink {
                                        CatDetailedView(cat: cat)
                                    } label: {
                                        GeometryReader{ geometry in
                                        CatRowView(urlString: cat.image?.url ?? "https://cdn2.thecatapi.com/images/ozEvzdVM-.jpg", cat: cat)
                                                .rotation3DEffect(
                                                    Angle(degrees: getPercantage(geo: geometry) * 40),
                                                    axis: (x:0.0, y:1.0, z:0.0))
                                               // .blur(radius: 1 - getPercantage(geo: geometry) * 10)

                                        }
                                        .frame(width: 315, height: 530)
                                    }
                                }
                        }

                    }
                .padding(.horizontal, 10)
            
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(colors: [
                    Color.MyTheme.darkBlue2,
                    Color.MyTheme.darkBlue
                                    ],
                               startPoint: .top,
                               endPoint: .bottom)
            )
            .onAppear{
                catDataViewModel.downloadCatData()
            }
            .navigationBarHidden(true)
            .searchable(text: $catSearch)
        }
        
    }
    
    func getPercantage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - currentX / maxDistance)
    }
}

struct CatListView_Previews: PreviewProvider {
    static var previews: some View {
        CatListView()
    }
}
