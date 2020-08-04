//
//  DepartamentListCoordinator.swift
//  home_work_13
//
//  Created by Pavel Bondar on 03.08.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

class DepartamentListCoordinator: Coordinator {
    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let departamentViewController: DepartamentView = .instantiate()
        let departamentViewModel = DepartamentListViewModel()
        departamentViewController.viewModel = departamentViewModel
        navigationController?.pushViewController(departamentViewController, animated: true)
    }
}
