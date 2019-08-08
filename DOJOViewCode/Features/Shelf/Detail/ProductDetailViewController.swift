//
//  ProductDetailViewController.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 23/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

final class ProductDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private let productDetailViewModel: ProductDetailViewModel
    private let productDetailView: ProductDetailView
    
    // MARK: - Initialization
    
    init(viewModel: ProductDetailViewModel) {
        productDetailViewModel = viewModel
        productDetailView = ProductDetailView(viewModel: productDetailViewModel)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Life cycle

extension ProductDetailViewController {
    
    override func loadView() {
        self.view = productDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = productDetailViewModel.productName
    }
}

