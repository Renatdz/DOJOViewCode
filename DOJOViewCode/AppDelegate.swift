//
//  AppDelegate.swift
//  DOJOViewCode
//
//  Created by Renato dos Santos Mendes on 23/07/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?
}

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        appCoordinator = AppCoordinator()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = appCoordinator?.start()
        window?.makeKeyAndVisible()
        
        return true
    }
}

