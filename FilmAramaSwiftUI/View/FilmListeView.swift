//
//  ContentView.swift
//  FilmAramaSwiftUI
//
//  Created by ceksi on 29.05.2023.
//

import SwiftUI

struct FilmListeView: View {
     
     @ObservedObject var filmListeViewModel : FilmListViewModel
    @State var aranacakFilm = ""
      
      init() {
          self.filmListeViewModel = FilmListViewModel()
          
      }
    var body: some View {
        NavigationView{
            VStack{
       
            TextField("Film ara", text: $aranacakFilm) { _ in} onCommit: {
                self.filmListeViewModel.getMovies(movieName: aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
            }.padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
           

        
        List (filmListeViewModel.filmler, id: \.imdbıd)
                { film in
            NavigationLink(
                destination:
                    DetayView(imdbId: film.imdbıd),
                 label: {
                    HStack () {
                OzelImage(url: film.poster)
                    .frame(width: 90, height: 130)
                    
                VStack(alignment: .leading){
                    Text(film.title)
                        .font(.title3)
                        .foregroundColor(.blue)
                    
                    Text(film.year)
                        .foregroundColor(.red)
                }
                    }
                
            })
                    }
        }.navigationTitle("Film Kitabı")
        }
        }
        }
        



struct FilmListeView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListeView()
    }
}
