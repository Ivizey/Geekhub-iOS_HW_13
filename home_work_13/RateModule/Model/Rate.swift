//
//  Rate.swift
//  home_work_13
//
//  Created by Pavel Bondar on 24.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Foundation

struct Rate {
    let currency: String
    let baseCurrency: String
    let buy: Double
    let sell: Double
}

extension Rate: Decodable {
    enum CodingKeys: String, CodingKey {
        case currency = "ccy"
        case baseCurrency = "base_ccy"
        case buy
        case sell = "sale"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.currency = try container.decode(String.self, forKey: .currency)
        self.baseCurrency = try container.decode(String.self, forKey: .baseCurrency)
        self.buy = Double(try container.decode(String.self, forKey: .buy)) ?? 0.0
        self.sell = Double(try container.decode(String.self, forKey: .sell)) ?? 0.0
    }

    static func makeDefault() -> Rate {
        return Rate(currency: "", baseCurrency: "", buy: 0.0, sell: 0.0)
    }
}
