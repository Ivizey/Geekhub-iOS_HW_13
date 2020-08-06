//
//  TabBarCoordinator.swift
//  home_work_13
//
//  Created by Pavel Bondar on 06.08.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

class TabBarCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let tabBarController = TabBarView()
        tabBarController.coordinator = self
        
        let rateListNavigationController = UINavigationController()
        rateListNavigationController.navigationBar.prefersLargeTitles = true
        let rate = UITabBarItem(title: "Курс", image: UIImage(systemName: "star.circle.fill"), tag: 0)
        rateListNavigationController.tabBarItem = rate
        let rateListCoordinator = RateListCoordinator(navigationController: rateListNavigationController)
        
        let departamentListNavigationController = UINavigationController()
        departamentListNavigationController.navigationBar.prefersLargeTitles = true
        let deprtament = UITabBarItem(title: "Відділення",
                                      image: UIImage(systemName: "magnifyingglass.circle.fill"), tag: 1)
        departamentListNavigationController.tabBarItem = deprtament
        let departamentListCoordinator = DepartamentListCoordinator(navigationController: departamentListNavigationController)
        
        tabBarController.viewControllers = [rateListNavigationController,
                                            departamentListNavigationController]
        
        coordinate(to: rateListCoordinator)
        coordinate(to: departamentListCoordinator)
        
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: false)
    }
}
