//
//  DepartamentListViewModel.swift
//  home_work_13
//
//  Created by Pavel Bondar on 06.08.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Foundation
import RxSwift
import RxSwiftUtilities

final class DepartamentListViewModel {
    private let networkService: NetworkServiceProtocol
    let title = "Відділення"
    let activityIndicator = ActivityIndicator()
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchDeparamentViewModels(city: String) -> Observable<[DepartamentViewModel]> {
        networkService.fetchDepartament(search: city).map { $0.map {
            DepartamentViewModel(departament: $0)
            }
        }
        .trackActivity(activityIndicator)
    }
}
