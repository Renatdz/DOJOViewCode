//
//  ShelfListDataSource.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 23/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

protocol ShelfListDataSourceDelegate: AnyObject {
    func didSelect(viewModel: ShelfListCellViewModel)
}

final class ShelfListDataSource: NSObject {
    
    private var viewModels: [ShelfListCellViewModel] = []
    private weak var delegate: ShelfListDataSourceDelegate?
    
    func set(_ viewModels: [ShelfListCellViewModel]) {
        self.viewModels.append(contentsOf: viewModels)
    }
    
    func set(_ delegate: ShelfListDataSourceDelegate?) {
        self.delegate = delegate
    }
    
    func clear() {
        viewModels.removeAll()
    }
}

extension ShelfListDataSource: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ShelfListCell = tableView.dequeueReusableCell(for: indexPath)
        
        let viewModel = viewModels[indexPath.row]
        cell.configure(with: viewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = viewModels[indexPath.row]
        delegate?.didSelect(viewModel: viewModel)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
