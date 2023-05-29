//
//  Film.swift
//  FilmAramaSwiftUI
//
//  Created by ceksi on 29.05.2023.
//

import Foundation

struct Film : Codable {
    
    let title :  String
    let year :  String
    let imdbId : String
    let type : String
    let poster : String
    
    private enum CodingKeys: String, CodingKey{
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbId"
        case type = "Type"
        case poster = "Poster"
        
    }
    
}

  struct GelenFilmler : Codable {
      let filmler : [Film]
    
    private enum CodingKeys : String, CodingKey {
        case filmler = "Search"
    }
}
