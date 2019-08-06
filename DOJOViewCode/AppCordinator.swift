//
//  AppCordinator.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 23/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    
    func start()
}

final class AppCoordinator {
    private var currentCoordinator: Coordinator?

    private let navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    func start() -> UIViewController {
        let shelfCoordinator = ShelfCoordinator(navigationController: navigationController)
        shelfCoordinator.start()
        
        currentCoordinator = shelfCoordinator
        
        return navigationController
    }
}
