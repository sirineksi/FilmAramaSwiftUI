//
//  OzelImage.swift
//  FilmAramaSwiftUI
//
//  Created by ceksi on 7.08.2023.
//

import SwiftUI

struct OzelImage : View {
    
    let url : String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url:String) {
        self.url = url
        self.imageDownloaderClient.gorselIndir(url: self.url)
    }
    var body: some View {
        if let data =
            self.imageDownloaderClient.indirilenGorsel {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }else {
            return Image("placeholder3")
                
            
            
        }
    }
}



struct OzelImage_Previews: PreviewProvider {
    static var previews: some View {
        OzelImage(url: "https://m.media-amazon.com/images/M/MV5BMTMxMjQ1MjA5Ml5BMl5BanBnXkFtZTcwNjIzNjg1Mw@@._V1_SX300.jpg")
    }
}
