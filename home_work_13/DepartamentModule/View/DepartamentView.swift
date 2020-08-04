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
    private let searchController = UISearchController(searchResultsController: nil)
    private let disposeBag = DisposeBag()
    internal var viewModel: DepartamentListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = viewModel.title
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Введіть назву міста (RUS)"
        navigationItem.searchController = searchController
        viewModel.activityIndicator.asDriver()
            .drive(UIApplication.shared.rx.isNetworkActivityIndicatorVisible)
            .disposed(by: disposeBag)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        searchController.searchBar.rx.text.orEmpty
            .throttle(.seconds(3), scheduler: MainScheduler.instance)
            .subscribe(onNext: { city in
                self.departamentTableView.dataSource = nil
                self.viewModel.fetchDeparamentViewModels(city: city).observeOn(MainScheduler.instance)
                    .bind(to: self.departamentTableView.rx
                        .items(cellIdentifier: "departamentCell")) { _, viewModel, cell in
                            cell.textLabel?.numberOfLines = 0
                            cell.detailTextLabel?.numberOfLines = 0
                            cell.textLabel?.attributedText = viewModel.displayDepartamentName
                            cell.detailTextLabel?.text = viewModel.displayAdditionalIfnformation
                    }
                .disposed(by: self.disposeBag)
            })
            .disposed(by: disposeBag)
    }
}
