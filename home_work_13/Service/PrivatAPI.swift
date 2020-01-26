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
    case getBranches(search: String)
}

extension PrivatAPI: TargetType {
    var baseURL: URL {
        URL(string: "https://api.privatbank.ua/p24api/")!
    }

    var path: String {
        switch self {
        case .getRate:
            return "pubinfo"
        case .getBranches:
            return "pboffice"
        }
    }

    var method: Method {
        .get
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        switch self {
        case .getRate:
            return .requestParameters(parameters: ["exchange": "",
                                                   "json": "",
                                                   "coursid": "11"],
                                      encoding: URLEncoding.queryString)
        case .getBranches(search: let search):
            return .requestParameters(parameters: ["json": "",
                                                   "city": search,
                                                   "address": ""],
                                      encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "aplication/json"]
    }
}
