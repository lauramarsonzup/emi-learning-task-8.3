//
//  BookDetailsViewController.swift
//  LearningTask-8.3
//
//  Created by Laura Pinheiro Marson on 09/11/22.
//

import UIKit

class BookDetailsViewController: UITableViewController {
    
    var livro: Livro? {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()

        guard let livro = livro else { return }
        tableView.tableHeaderView = BookDetailsTableHeaderView.constroi(para: livro)
        tableView.tableFooterView = BookDetailsTableFooterView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        guard let headerView = tableView.tableHeaderView else {return}
        let size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        if headerView.frame.size.height != size.height {
            headerView.frame.size.height = size.height
            tableView.tableHeaderView = headerView
            tableView.layoutIfNeeded()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return livro?.precos.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TipoDeLivroViewCell", for: indexPath) as? TipoDeLivroViewCell else {
            fatalError("Não foi possível carregar a célula de tipo de livro")
        }

        cell.preco = livro!.precos[indexPath.row]
        cell.buttonTag = indexPath.row

        return cell
    }
    


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "carrinhoDeComprasSegue" else { return }
        
        guard let button = sender as? UIButton else {
            fatalError("Não foi possível preparar para segue \(segue.identifier!)")
        } //o sender é um botão e não a cell

        guard let destinationController = segue.destination as? CarrinhoDeComprasViewController,
                let livro = livro else {
            fatalError("Não foi possível preparar para segue \(segue.identifier!)")
        }
        
        let itemDeCompra = ItemDeCompra(livro: livro, preco: livro.precos[button.tag])
        CarrinhoDeCompras.itens.append(itemDeCompra)
        
        destinationController.itensDoCarrinho = CarrinhoDeCompras.itens
        destinationController.valorTotalDoCarrinho = CarrinhoDeCompras.valorTotal()
    }

}
