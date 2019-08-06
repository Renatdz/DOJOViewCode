//
//  ShelfCoordinator.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 23/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

final class ShelfCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let shelfListcontroller = ShelfListViewController(delegate: self)
        navigationController.pushViewController(shelfListcontroller, animated: true)
    }
}

extension ShelfCoordinator: ShelfListViewControllerDelegate {
    
    func presentDetail(with product: Product) {
        let productDetailController = ProductDetailViewController(product: product)
        navigationController.pushViewController(productDetailController, animated: true)
    }
}
