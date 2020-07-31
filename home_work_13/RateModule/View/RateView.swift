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
    private var viewModel: RateListViewModel!

    static func instantiate(viewModel: RateListViewModel) -> RateView {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "RateView") as RateView
        controller.viewModel = viewModel
        return controller
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        navigationItem.title = viewModel.title
        viewModel.fetchRateViewModels().observeOn(MainScheduler.instance)
        .bind(to: rateTableView.rx.items(cellIdentifier: "rateCell")) { _, viewModel, cell in
            cell.imageView?.tintColor = .black
            cell.imageView?.image = viewModel.displayImage
            cell.textLabel?.attributedText = viewModel.displayСurrency
            cell.detailTextLabel?.numberOfLines = 0
            cell.detailTextLabel?.text = viewModel.displayRate
        }
        .disposed(by: disposeBag)
    }
}
