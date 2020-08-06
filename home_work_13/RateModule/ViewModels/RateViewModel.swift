//
//  RateViewModel.swift
//  home_work_13
//
//  Created by Pavel Bondar on 06.08.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Foundation
import UIKit

enum Сurrency: String {
    case usd = "USD"
    case eur = "EUR"
    case rur = "RUR"
    case btc = "BTC"
}

struct RateViewModel {
    private let rate: Rate
    
    var displayСurrency: NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20, weight: .medium),
            .foregroundColor: UIColor.systemGreen,
        ]
        let currency = rate.currency + "/" + rate.baseCurrency
        return NSAttributedString(string: currency, attributes: attributes)
    }
    var displayRate: String {
        return "Купівля: " + String(format: "%.2f", rate.buy) +
               "\nПродаж: " + String(format: "%.2f", rate.sell)
    }
    var displayImage: UIImage? {
        let currency = Сurrency(rawValue: rate.currency)
        switch currency {
        case .usd: return UIImage(systemName: "dollarsign.circle")
        case .eur: return UIImage(systemName: "eurosign.circle")
        case .rur: return UIImage(systemName: "rublesign.circle")
        case .btc: return UIImage(systemName: "bitcoinsign.circle")
        default: return UIImage(systemName: "questionmark.circle")
        }
    }
    
    init(rate: Rate) {
        self.rate = rate
    }
}
