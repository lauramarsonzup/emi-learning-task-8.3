//
//  BookDetailsTableFooterView.swift
//  LearningTask-8.3
//
//  Created by Laura Pinheiro Marson on 09/11/22.
//

import UIKit

class BookDetailsTableFooterView: UIView {

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "* Você terá acesso às futuras correções do livro."
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .pampas
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        addSubview(label)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 20),
        ])
    }

}
