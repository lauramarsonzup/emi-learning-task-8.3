//
//  BookDetailsTableHeaderView.swift
//  LearningTask-8.3
//
//  Created by Laura Pinheiro Marson on 09/11/22.
//

import UIKit

class BookDetailsTableHeaderView: UIView {
    
    static func constroi(para livro: Livro) -> BookDetailsTableHeaderView {
        let frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        return BookDetailsTableHeaderView(com: frame, e: livro)
    }

    private lazy var tituloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26, weight: .semibold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = livro.titulo
        return label
    }()
    
    private lazy var subtituloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .light)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = livro.subtitulo
        return label
    }()
    
    private lazy var autorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = livro.autor?.nomeCompleto
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [
            tituloLabel,
            subtituloLabel,
            autorLabel
        ])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fillProportionally
        stackview.spacing = 12
        return stackview
    }()
    
    private lazy var capaImageView: UIView = {
        let height = 180.0
        let tamanhoBase = CGSize.init(width: height / 1.41, height: height)
    
        let imageView = UIImageView(frame: .init(origin: .zero, size: tamanhoBase))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: livro.imagemDeCapaURI)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: tamanhoBase.width),
            imageView.heightAnchor.constraint(equalToConstant: tamanhoBase.height),
        ])
        
        let view = UIView()
        view.addSubview(imageView)
        return imageView
    }()
    
    private lazy var containerView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [
            labelsStackView,
            capaImageView
        ])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.distribution = .fillProportionally
        stackview.spacing = 12
        stackview.isLayoutMarginsRelativeArrangement = true
        stackview.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        return stackview
    }()
    
    var livro: Livro
    
    private init(com frame: CGRect, e livro: Livro) {
        self.livro = livro
        super.init(frame: frame)
        setup()
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .pampas
        addViews()
        addConstraints()
    }

    private func addViews() {
        addSubview(containerView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }

}
