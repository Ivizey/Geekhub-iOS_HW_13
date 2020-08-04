//
//  TabBarController.swift
//  home_work_13
//
//  Created by Pavel Bondar on 03.08.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

class TabBarView: UITabBarController {
    var coordinator: TabBarCoordinator?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        self.tabBar.layer.masksToBounds = true
        self.tabBar.barStyle = .black
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .systemGreen

        self.tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.tabBar.layer.shadowRadius = 10
        self.tabBar.layer.shadowOpacity = 1
        self.tabBar.layer.masksToBounds = false
    }
}
