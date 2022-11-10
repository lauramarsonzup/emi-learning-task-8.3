//
//  ItemDeCompraViewCell.swift
//  LearningTask-8.3
//
//  Created by Laura Pinheiro Marson on 10/11/22.
//

import UIKit

class ItemDeCompraViewCell: UITableViewCell {

    @IBOutlet weak var capaImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var autorLabel: UILabel!
    @IBOutlet weak var tipoDoLivroLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    
    var itemDeCompra: ItemDeCompra? {
        didSet {
            guard let itemDeCompra = itemDeCompra else { return }
            
            capaImageView.image = .init(named: itemDeCompra.livro.imagemDeCapaURI)
            tituloLabel.text = itemDeCompra.livro.titulo
            autorLabel.text = itemDeCompra.livro.autor?.nomeCompleto
            tipoDoLivroLabel.text = itemDeCompra.preco.tipoDeLivro.rawValue
            precoLabel.text = Formatter.paraMoeda(decimal: itemDeCompra.preco.valor)
        }
    }
}
