//
//  CarrinhoDeComprasViewController.swift
//  LearningTask-8.3
//
//  Created by Laura Pinheiro Marson on 09/11/22.
//

import UIKit

class CarrinhoDeComprasViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var valorTotalLabel: UILabel!
    
    var itensDoCarrinho: [ItemDeCompra] = [] {
        didSet {
            guard isViewLoaded else { return }
            tableView.reloadData()
        }
    }
    
    var valorTotalDoCarrinho: Decimal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        
        setupTableView()
        
        exibirValorTotalDoCarrinho()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(CarrinhoSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: CarrinhoSectionHeaderView.reuseId)
        tableView.sectionHeaderHeight = CarrinhoSectionHeaderView.alturaBase
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
    }
    
    private func exibirValorTotalDoCarrinho() {
        valorTotalLabel.text = Formatter.paraMoeda(decimal: valorTotalDoCarrinho)
    }

}

extension CarrinhoDeComprasViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itensDoCarrinho.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDeCompraViewCell", for: indexPath) as? ItemDeCompraViewCell else {
            fatalError("Não foi possível carregar célula de Item de Compra")
        }
        
        cell.itemDeCompra = itensDoCarrinho[indexPath.row]
        return cell
    }
    
}

extension CarrinhoDeComprasViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CarrinhoSectionHeaderView.reuseId) as? CarrinhoSectionHeaderView else {
            fatalError("Não foi possível carregar a Header Section")
        }
        
        header.titulo = "Seu carrinho de compras"
        return header
    }
}
