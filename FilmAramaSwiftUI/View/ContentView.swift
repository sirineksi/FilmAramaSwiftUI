//
//  ContentView.swift
//  FilmAramaSwiftUI
//
//  Created by ceksi on 29.05.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            DownloaderClient().filmleriIndır(search: "pulp") { (sonuc) in
                switch sonuc {
                case.success(let filmDizisi):
                    print (filmDizisi)
                case.failure(let hata) :
                    print(hata)
                }
            }
            
        }, label: {
            Text("test yap")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
