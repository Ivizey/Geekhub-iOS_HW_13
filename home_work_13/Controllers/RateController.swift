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
    private let images = ["dollarsign.circle",
                          "eurosign.circle",
                          "rublesign.circle",
                          "bitcoinsign.circle"]
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
                self.rates = object
                print(object)
            } catch {
                print(error)
            }
        }
    }
}

extension RateController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RateCell", for: indexPath) as! CellForRate
        cell.setRateImage(image: UIImage(systemName: images[indexPath.row]) ?? UIImage())
        return cell
    }
}
