//
//  BranchController.swift
//  home_work_13
//
//  Created by Pavel Bondar on 24.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit
import Moya

class BranchController: UIViewController {
    
    let provider = MoyaProvider<PrivatAPI>()

    override func viewDidLoad() {
        super.viewDidLoad()
        getBranch()
    }
    
    private func getBranch() {
        provider.request(.getBranches) { rates in
            do {
                let response = try rates
                    .get()
                    .filter(statusCode: 200)
                let object = try response.map([Branch].self)
                print(object)
            } catch {
                print(error)
            }
        }
    }
}
