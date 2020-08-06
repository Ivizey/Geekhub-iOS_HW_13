//
//  RateListViewModel.swift
//  home_work_13
//
//  Created by Pavel Bondar on 06.08.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Foundation
import RxSwift
import RxSwiftUtilities

final class RateListViewModel {
    private let networkService: NetworkServiceProtocol
    let title = "Курс валют"
    let activityIndicator = ActivityIndicator()
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchRateViewModels() -> Observable<[RateViewModel]> {
        networkService.fetchRate().map { $0.map {
            RateViewModel(rate: $0)
            }
        }
        .trackActivity(activityIndicator)
    }
}
