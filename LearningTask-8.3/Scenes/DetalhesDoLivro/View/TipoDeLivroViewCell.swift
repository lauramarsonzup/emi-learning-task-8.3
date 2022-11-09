//
//  TipoDeLivroViewCell.swift
//  LearningTask-8.3
//
//  Created by Laura Pinheiro Marson on 09/11/22.
//

import UIKit

class TipoDeLivroViewCell: UITableViewCell {
    
    @IBOutlet private weak var tipoDeLivroLabel: UILabel!
    @IBOutlet private weak var precoLabel: UILabel!
    
    var preco: Preco? {
        didSet {
            guard let preco = preco else { return }
            
            tipoDeLivroLabel.text = preco.tipoDeLivro.rawValue
            precoLabel.text = String(describing: preco.valor)
        }
    }
}
