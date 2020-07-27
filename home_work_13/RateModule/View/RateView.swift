//
//  RateView.swift
//  home_work_13
//
//  Created by Pavel Bondar on 23.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RateView: UIViewController {
    @IBOutlet private weak var rateTableView: UITableView!
    private let disposeBag = DisposeBag()
    private let viewModel = RateListViewModel()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        navigationItem.title = viewModel.title
        viewModel.fetchRateViewModels().observeOn(MainScheduler.instance)
        .bind(to: rateTableView.rx.items(cellIdentifier: "rateCell")) { _, viewModel, cell in
            cell.imageView?.image = viewModel.displayImage
            cell.textLabel?.text = viewModel.displayСurrency
            cell.detailTextLabel?.numberOfLines = 0
            cell.detailTextLabel?.text = viewModel.displayRate
        }
        .disposed(by: disposeBag)
    }
}
