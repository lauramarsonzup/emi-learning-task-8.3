//
//  Preco.swift
//  LearningTask-8.3
//
//  Created by Laura Pinheiro Marson on 09/11/22.
//

import Foundation

struct Preco {
    let valor: Decimal
    let tipoDeLivro: TipoDeLivro
}

enum TipoDeLivro: String {
    case ebook = "E-book*"
    case impresso = "Impresso"
    case combo = "E-book + Impresso"
}
