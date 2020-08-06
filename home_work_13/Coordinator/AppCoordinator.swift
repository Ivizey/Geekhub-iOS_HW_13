//
//  AppCoordinator.swift
//  home_work_13
//
//  Created by Pavel Bondar on 06.08.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationItem.largeTitleDisplayMode = .always
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: tabBarCoordinator)
    }
}
