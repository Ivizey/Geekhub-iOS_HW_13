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
    internal var viewModel: RateListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = viewModel.title
        viewModel.activityIndicator.asDriver()
            .drive(UIApplication.shared.rx.isNetworkActivityIndicatorVisible)
            .disposed(by: disposeBag)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        rateTableView.dataSource = nil
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
