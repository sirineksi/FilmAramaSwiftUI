//
//  FilmViewModel.swift
//  FilmAramaSwiftUI
//
//  Created by ceksi on 30.05.2023.
//

import Foundation
import SwiftUI

class FilmListViewModel : ObservableObject {
    
    @Published var filmler = [FilmViewModel]()
    
    let downloaderClient = DownloaderClient()
    
    func getMovies(movieName: String) {
        downloaderClient.filmleriIndır(search: movieName) { (sonuc) in
            switch sonuc {
            case.failure(let hata ) :
                print(hata)
            case.success(let filmDizisi) :
                if let  filmDizisi = filmDizisi {
                    DispatchQueue.main.async {
                        self.filmler = filmDizisi.map(FilmViewModel.init)
                    }
                    
                }
            }
        }
    }
    
    
}

struct FilmViewModel {
    let film : Film
    
    var title : String {
        film.title
    }
    var poster : String {
        film.poster
    }
    var year : String {
        film.year
    }
    var imdbıd : String {
        film.imdbId
    }
    
    
    
}
