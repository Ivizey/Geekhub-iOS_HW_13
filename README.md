# Exchange rate(geekhub IOS home work #13)
A mobile application to keep track of the current exchange rate, as well as view a list of offices located in a particular city. Data is provided by Privat Bank using an open API
<p align="center">
    <img src="https://github.com/Ivizey/Geekhub-iOS_HW_13/blob/master/images/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202020-03-06%20at%2016.47.42.png" width="200">
    <img src="https://github.com/Ivizey/Geekhub-iOS_HW_13/blob/master/images/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202020-03-06%20at%2016.47.50.png" width="200">
    <img src="https://github.com/Ivizey/Geekhub-iOS_HW_13/blob/master/images/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202020-03-06%20at%2016.47.54.png" width="200">
    <img src="https://github.com/Ivizey/Geekhub-iOS_HW_13/blob/master/images/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202020-03-06%20at%2016.48.15.png" width="200">
</p>

## Getting Started

Authentication is handled with a simple API.
They're free for development, open-source, and non-commercial use, and you can get one here: [get API Privat24](https://api.privatbank.ua/#p24/exchange).

```
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
```

## Deployment

### Data from Privat24 API:
```
struct Rate: Decodable {
    let currency: String
    let baseCurrency: String
    let buy: Double
    let sell: Double
}

struct Branch: Decodable {
    let country: String
    let state: String
    let city: String
    let index: String
    let address: String
    let phone: String
    let email: String
    let name: String
}
```

### Request parameters(exchange rate, offices) ([Details](https://api.privatbank.ua))
```
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
```

## Built With
* [Moya](https://github.com/Moya/Moya) - Network abstraction layer written in Swift.
* [UIKit](https://developer.apple.com/documentation/uikit) -  Construct and manage a graphical, event-driven user interface for your iOS or tvOS app. 
* [Privat24 API](https://api.privatbank.ua)
