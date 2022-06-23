//
//  LivroSectionHeaderView.swift
//  LearningTask-7.3
//
//  Created by rafael.rollo on 16/05/2022.
//

import UIKit

class LivroSectionHeaderView: UICollectionReusableView {
    @IBOutlet private weak var tituloLabel: UILabel!
    
    var titulo: String? {
        didSet {
            tituloLabel.text = titulo
        }
    }
}
