//
//  CatImageView.swift
//  Catcyclopedia
//
//  Created by Emrah Karabulut on 12.10.2022.
//

import SwiftUI

struct CatImageView: View {
    
    let urlString: String
    //@State var data: Data?
    @State var image: UIImage?
    @StateObject private var catimageViewModel = CatImageViewModel()
    
   

    var body: some View {
        VStack{
            if let image = catimageViewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    //.frame(width: .infinity, height: .infinity)
                   
            } else{
                Image(systemName: "video")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 70)
                    .background(Color.gray)
                
            }
        }
        .frame(width: 300, height: 400)
        .onAppear{
            //fetchData()
            catimageViewModel.downloadCatImage(url: URL(string: urlString))
        }
    }

//    private func fetchData() {
//        guard let url = URL(string: urlString) else{
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: URL(string: urlString) ?? URL(string: "")!) { data, _, _ in
//            self.data = data
//        }
//        task.resume()
//    }
    
}

struct CatImageView_Previews: PreviewProvider {
    static var previews: some View {
        CatImageView(urlString: "https://cdn2.thecatapi.com/images/ozEvzdVM-.jpg")
    }
}




