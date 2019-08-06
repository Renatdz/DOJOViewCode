//
//  ShelfListViewController.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 23/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

protocol ShelfListViewControllerDelegate: AnyObject {
    func presentDetail(with product: Product)
}

final class ShelfListViewController: UIViewController {
    
    // MARK: - Properties
    
    private let shelfListView: ShelfListView = ShelfListView()
    private let products: [Product] = ProductGenerator.products()
    private weak var delegate: ShelfListViewControllerDelegate?
    
    // MARK: - Initialization
    
    init(delegate: ShelfListViewControllerDelegate?) {
        self.delegate = delegate
        
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
        shelfListView.set(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Product Shelf"
        
        shelfListView.updateList(products: products)
    }
}

// MARK: - ShelfListDataSourceDelegate

extension ShelfListViewController: ShelfListDataSourceDelegate {
    
    func didSelect(product: Product) {
        delegate?.presentDetail(with: product)
    }
}
