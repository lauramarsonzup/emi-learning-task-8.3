//
//  CarrinhoDeCompra.swift
//  LearningTask-8.3
//
//  Created by Laura Pinheiro Marson on 10/11/22.
//

import Foundation

struct CarrinhoDeCompras {
    static var itens: [ItemDeCompra] = []
    
    static func valorTotal() -> Decimal {
        return itens.map { $0.preco.valor }
                    .reduce(0) { $0 + $1 }
    }
}
