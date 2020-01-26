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
    @IBOutlet private weak var rateTableView: UITableView!
    private let images = ["dollarsign.circle",
                          "eurosign.circle",
                          "rublesign.circle",
                          "bitcoinsign.circle"]
    private let provider = MoyaProvider<PrivatAPI>()
    private var rates = [Rate]()

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
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
                DispatchQueue.main.async {
                    self.rates = object
                    self.rateTableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension RateController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rate = rates[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RateCell", for: indexPath) as! CellForRate
        cell.setRateImage(image: UIImage(systemName: images[indexPath.row]) ?? UIImage())
        cell.setCurrencyLabel(currency: rate.currency, baseCurrency: rate.baseCurrency)
        cell.setBuyLabel(buy: rate.buy)
        cell.setSellLabel(sell: rate.sell)
        return cell
    }
}
