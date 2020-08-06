//
//  NetworkService.swift
//  home_work_13
//
//  Created by Pavel Bondar on 06.08.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Foundation
import RxSwift
import Moya

protocol NetworkServiceProtocol {
    func fetchRate() -> Observable<[Rate]>
    func fetchDepartament(search: String) -> Observable<[Departament]>
}

class NetworkService: NetworkServiceProtocol {
    private let provider = MoyaProvider<PrivatAPI>()
    
    func fetchRate() -> Observable<[Rate]> {
        return provider.rx.request(.getRate)
            .asObservable()
            .filterSuccessfulStatusAndRedirectCodes()
            .map([Rate].self)
    }
    
    func fetchDepartament(search: String) -> Observable<[Departament]> {
        return provider.rx.request(.getDepartament(search: search))
            .asObservable()
            .filterSuccessfulStatusAndRedirectCodes()
            .map([Departament].self)
    }
}
