//
//  ShelfCoordinator.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 23/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

protocol ShelfCoordinatorDelegate: AnyObject {
    func presentDetail(with product: Product)
}

final class ShelfCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let repository = ShelfListRepository(request: "OPA")
        let viewModel = ShelfListViewModel(repository: repository)
        let shelfListcontroller = ShelfListViewController(viewModel: viewModel, coordinatorDelegate: self)
        navigationController.pushViewController(shelfListcontroller, animated: true)
    }
}

extension ShelfCoordinator: ShelfCoordinatorDelegate {
    
    func presentDetail(with product: Product) {
        let productDetailViewModel = ProductDetailViewModel(product: product)
        let productDetailController = ProductDetailViewController(viewModel: productDetailViewModel)
        navigationController.pushViewController(productDetailController, animated: true)
    }
}
