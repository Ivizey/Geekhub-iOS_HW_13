//
//  DepartamentViewModel.swift
//  home_work_13
//
//  Created by Pavel Bondar on 06.08.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Foundation
import UIKit

struct DepartamentViewModel {
    private let departament: Departament

    var displayDepartamentName: NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20, weight: .medium),
            .foregroundColor: UIColor.systemGreen,
        ]
        return NSAttributedString(string: departament.name, attributes: attributes)
    }
    var displayAdditionalIfnformation: String {
        return "Місто: \(departament.city)\n" +
            "Індекс: \(departament.index)\n" +
            "Адреса: \(departament.address)\n" +
            "Телефон: \(departament.phone)\n" +
            "E-mail: \(departament.email)"
    }
    
    init(departament: Departament) {
        self.departament = departament
    }
}
