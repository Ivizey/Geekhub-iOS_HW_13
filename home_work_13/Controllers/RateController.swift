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
    private let images = ["bitcoin",
                          "dollar",
                          "euro",
                          "rubli"]
    private let provider = MoyaProvider<PrivatAPI>()
    private var rates = [Rate]()

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.getRate()
        }
    }
    
    @IBAction private func refreshButtonAction(_ sender: UIBarButtonItem) {
        getRate()
    }
    
    private func getRate() {
        provider.request(.getRate) { rates in
            do {
                let response = try rates
                    .get()
                    .filter(statusCode: 200)
                let object = try response.map([Rate].self)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.rates = object
                }
                print(object)
            } catch {
                print(error)
            }
        }
    }
}

extension RateController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return rates.count
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rateCell", for: indexPath) as! RateCell
//        cell.setRateImage(image: UIImage(systemName: images[indexPath.row]) ?? UIImage())
//        cell.setCurrencyLabel(currency: rates[indexPath.row].currency, baseCurrency: rates[indexPath.row].baseCurrency)
//        cell.setBuyLabel(buy: rates[indexPath.row].buy)
//        cell.setSellLabel(sell: rates[indexPath.row].sell)
        return cell
    }
}
