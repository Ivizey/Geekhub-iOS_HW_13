//
//  RateListCoordinator.swift
//  home_work_13
//
//  Created by Pavel Bondar on 06.08.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

class RateListCoordinator: Coordinator {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let rateListViewController: RateView = .instantiate()
        let rateViewModel = RateListViewModel()
        rateListViewController.viewModel = rateViewModel
        navigationController?.pushViewController(rateListViewController, animated: true)
    }
}
