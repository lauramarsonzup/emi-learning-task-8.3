//
//  Formatter.swift
//  LearningTask-8.3
//
//  Created by Laura Pinheiro Marson on 10/11/22.
//

import Foundation

class Formatter {
    static func paraMoeda(decimal: Decimal) -> String {
        let formatador = NumberFormatter()
        formatador.numberStyle = .currency
        formatador.locale = Locale(identifier: "pt_BR")
        
        return formatador.string(from: decimal as NSDecimalNumber)!
    }
}
