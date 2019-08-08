//
//  ShelfListViewController.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 23/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

final class ShelfListViewController: UIViewController {
    
    // MARK: - Properties
    
    private let shelfListView: ShelfListView = ShelfListView()
    
    private let listViewModel: ShelfListViewModel
    private weak var coordinator: ShelfCoordinatorDelegate?
    
    // MARK: - Initialization
    
    init(viewModel: ShelfListViewModel, coordinatorDelegate: ShelfCoordinatorDelegate?) {
        listViewModel = viewModel
        coordinator = coordinatorDelegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Life cycle

extension ShelfListViewController {
    
    override func loadView() {
        self.view = shelfListView
        shelfListView.set(dataSourceDelegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Product Shelf"
        
        fetchProducts()
    }
}

extension ShelfListViewController {
    
    func fetchProducts() {
        listViewModel.fetchProducts(success: { [weak self] cellViewModels in
            
            self?.shelfListView.updateList(viewModels: cellViewModels)
            
        }, failure: { message in
            // present alert
        })
    }
}

// MARK: - ShelfListDataSourceDelegate

extension ShelfListViewController: ShelfListDataSourceDelegate {
    
    func didSelect(viewModel: ShelfListCellViewModel) {
        coordinator?.presentDetail(with: viewModel.product)
    }
}
