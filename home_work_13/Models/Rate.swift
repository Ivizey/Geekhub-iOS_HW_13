//
//  Rate.swift
//  home_work_13
//
//  Created by Pavel Bondar on 24.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Foundation

struct Rate: Decodable {
    let currency: String
    let baseCurrency: String
    let buy: String
    let sell: String
    
    enum CodingKeys: String, CodingKey {
        case currency = "ccy"
        case baseCurrency = "base_ccy"
        case buy
        case sell = "sale"
    }
}
