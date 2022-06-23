//
//  Livro.swift
//  LearningTask-8.2
//
//  Created by rafael.rollo on 23/06/2022.
//

import Foundation

struct Livro {
    let titulo: String
    let imagemDeCapaURI: String
    let autor: Autor?
    
    init(titulo: String, imagemDeCapaURI: String, autor: Autor? = nil) {
        self.titulo = titulo
        self.imagemDeCapaURI = imagemDeCapaURI
        self.autor = autor
    }
}
