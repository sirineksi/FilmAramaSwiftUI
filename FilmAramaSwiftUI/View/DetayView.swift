//
//  DetayView.swift
//  FilmAramaSwiftUI
//
//  Created by ceksi on 8.08.2023.
//

import SwiftUI

struct DetayView: View {
    let imdbId: String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    var body: some View {
        ScrollView{
        VStack {
            OzelImage(url:
                filmDetayViewModel.filmDetayi?.poster  ?? "").frame(width: UIScreen.main.bounds.width * 0.6,
                height : UIScreen.main.bounds.height * 0.3 , alignment: .center)
            
            Text(filmDetayViewModel.filmDetayi?.title ?? "Film İsmi Gösterilecek")
                .font(.title)
                .padding()
                .foregroundColor(.red)
            
            Text(filmDetayViewModel.filmDetayi?.year ?? "Yıl: Yıl Gösterilecek ")
               
                .foregroundColor(.red)
            
            
            Text(filmDetayViewModel.filmDetayi?.plot ?? "Film plotu gösterilecek")
                .padding()
                .foregroundColor(.black)
        
            Text(filmDetayViewModel.filmDetayi?.director ?? "Yönetmen: Yönetmen Gösterilecek ")
                .padding()
                .foregroundColor(.red)
            Text(filmDetayViewModel.filmDetayi?.writer ?? "Yazar: Yazar Gösterilecek ").padding()
                .foregroundColor(.red)
            Text(filmDetayViewModel.filmDetayi?.awards ?? "Ödül: Ödüller Gösterilecek ").padding()
                .foregroundColor(.red)
                
            
            
            
            
            
        }}.onAppear (perform: {
            self.filmDetayViewModel.filmDetayiAl(imdbId: imdbId)
        })
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId: "test")
    }
}
