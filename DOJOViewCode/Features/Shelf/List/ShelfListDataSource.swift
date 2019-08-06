//
//  ShelfListDataSource.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 23/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

protocol ShelfListDataSourceDelegate: AnyObject {
    func didSelect(product: Product)
}

final class ShelfListDataSource: NSObject {
    
    private var products: [Product] = []
    private weak var delegate: ShelfListDataSourceDelegate?
    
    func set(_ products: [Product]) {
        self.products.append(contentsOf: products)
    }
    
    func set(_ delegate: ShelfListDataSourceDelegate?) {
        self.delegate = delegate
    }
    
    func clear() {
        products.removeAll()
    }
}

extension ShelfListDataSource: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ShelfListCell = tableView.dequeueReusableCell(for: indexPath)
        
        let product = products[indexPath.row]
        cell.configure(with: product)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        delegate?.didSelect(product: product)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
