//
//  PrivatAPI.swift
//  home_work_13
//
//  Created by Pavel Bondar on 23.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import Moya

enum PrivatAPI {
    case getRate
    case getBranches
}

extension PrivatAPI: TargetType {
    var baseURL: URL {
        URL(string: "https://api.privatbank.ua/")!
    }
    
    var path: String {
        switch self {
        case .getRate:
            return "p24api/pubinfo"
        case .getBranches:
            return "p24api/pboffice"
        }
    }
    
    var method: Method {
        .get
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        .requestPlain
    }
    
    var headers: [String : String]? {
        ["exchange": "",
         "json": "",
         "coursid": "11"]
    }
}
