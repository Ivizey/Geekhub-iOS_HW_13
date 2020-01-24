//
//  RateController.swift
//  home_work_13
//
//  Created by Pavel Bondar on 23.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit
import Moya

class RateController: UIViewController {
    
    let provider = MoyaProvider<PrivatAPI>()

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.getRate()
        }
    }
    
    private func getRate() {
        provider.request(.getRate) { rates in
            do {
                let response = try rates
                    .get()
                    .filter(statusCode: 200)
                let object = try response.map([Rate].self)
                print(object)
            } catch {
                print(error)
            }
        }
    }
}

