//
//  LivroSectionHeaderView.swift
//  LearningTask-8.3
//
//  Created by rafael.rollo on 23/06/2022.
//

import UIKit

class LivroSectionHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var sectionTitleView: SectionTitleView!
    
    var titulo: String? {
        didSet {
            sectionTitleView.texto = titulo
        }
    }
}
