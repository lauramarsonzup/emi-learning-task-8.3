//
//  Livro.swift
//  LearningTask-8.3
//
//  Created by rafael.rollo on 23/06/2022.
//

import Foundation

struct Livro {
    let titulo: String
    let subtitulo: String
    let imagemDeCapaURI: String
    let autor: Autor?
    let precos: [Preco]
    
    init(titulo: String, subtitulo: String, imagemDeCapaURI: String, autor: Autor? = nil, precos: [Preco]) {
        self.titulo = titulo
        self.subtitulo = subtitulo
        self.imagemDeCapaURI = imagemDeCapaURI
        self.autor = autor
        self.precos = precos
    }
}
