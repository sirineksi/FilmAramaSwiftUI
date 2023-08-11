//
//  DownloaderClient.swift
//  FilmAramaSwiftUI
//
//  Created by ceksi on 29.05.2023.
//

import Foundation

class DownloaderClient {
    
    func filmleriIndır(search: String, complation: @escaping (Result<[Film]?, DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=f4f140e0") else {
            return complation(.failure(.yanlisUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response , error) in
            guard let data = data, error == nil else {
                return complation(.failure(.veriGelmedi))
            }
            
            guard let filmCevabı = try? JSONDecoder().decode(GelenFilmler.self, from: data)
            else {
                return complation(.failure(.veriIslenemedi))
            }
            
            complation(.success(filmCevabı.filmler))
       
        }.resume()
        
    }
     
    func filmDetayiniIndir(imdbId: String, complation: @escaping(Result<FilmDetay,DownloaderError>)-> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=f4f140e0") else {
            return complation(.failure(.yanlisUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data , error == nil else {
                return complation(.failure(.veriGelmedi))
            }
            
            guard let gelenFilmDetayi = try? JSONDecoder().decode(FilmDetay.self, from:data )
            else {
                return complation(.failure(.veriIslenemedi))
            }
            complation(.success(gelenFilmDetayi))
            
        }.resume()
    }
    
    
    
}

enum DownloaderError : Error {
    case yanlisUrl
    case veriGelmedi
    case veriIslenemedi
    
    
}
