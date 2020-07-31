//
//  BranchController.swift
//  home_work_13
//
//  Created by Pavel Bondar on 24.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DepartamentView: UIViewController {
    @IBOutlet private weak var departamentTableView: UITableView!
    private let disposeBag = DisposeBag()
    private let viewModel = DepartamentListViewModel()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        navigationItem.title = viewModel.title
        viewModel.fetchDeparamentViewModels(city: "Киев").observeOn(MainScheduler.instance)
        .bind(to: departamentTableView.rx.items(cellIdentifier: "departamentCell")) { _, viewModel, cell in
            cell.textLabel?.numberOfLines = 0
            cell.detailTextLabel?.numberOfLines = 0
            cell.textLabel?.attributedText = viewModel.displayDepartamentName
            cell.detailTextLabel?.text = viewModel.displayAdditionalIfnformation
        }
        .disposed(by: disposeBag)
    }
}
