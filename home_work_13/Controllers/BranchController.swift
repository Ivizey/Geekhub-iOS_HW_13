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
    @IBOutlet private weak var branchTableView: UITableView!
    private let city = ["Киев",
                        "Николаев",
                        "Черкассы",
                        "Ровно"]
    private let provider = MoyaProvider<PrivatAPI>()
    private var branches = [Branch]()

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.getBranch(search: nil)
        }
    }
    
    @IBAction func searchCityButton(_ sender: UIBarButtonItem) {
        createAlert()
    }
    
    private func getBranch(search: String?) {
        provider.request(.getBranches(search: search ?? "Киев") ) { rates in
            do {
                let response = try rates
                    .get()
                    .filter(statusCode: 200)
                let object = try response.map([Branch].self)
                DispatchQueue.main.async {
                    self.branches = object
                    self.branchTableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func createAlert() {
        let alert = UIAlertController(title: "Оберіть місто", message: "\n\n\n\n\n", preferredStyle: .alert)
        let pickerFrame = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140))
        alert.view.addSubview(pickerFrame)
        pickerFrame.dataSource = self
        pickerFrame.delegate = self
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        self.present(alert,animated: true, completion: nil )
    }
}

extension BranchController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return branches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let branch = branches[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellForBranch", for: indexPath) as! CellForBranch
        cell.setNameLabel(name: branch.name)
        cell.cityLabel(city: branch.city)
        cell.phoneLabel(phone: branch.phone)
        cell.emailLabel(email: branch.email)
        cell.addressLabel(address: branch.address)
        return cell
    }
}

extension BranchController:  UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return city.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return city[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        getBranch(search: city[row])
    }
}
