//
//  FixerAPI.swift
//  LeBaluchon
//
//  Created by David Chea on 31/12/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import Alamofire
import SwiftyJSON

struct FixerAPI {
    
    // MARK: - Properties
    
    static let shared = FixerAPI()
    private let rateFromEuroToDollarEndpoint = "http://data.fixer.io/api/latest?access_key=363596384dd4e74590948b5c03bc8784&base=EUR&symbols=USD"
    
    // MARK: - Method
    
    func getRateFromEuroToDollar(_ completion: @escaping (Double) -> Void) {
        Alamofire.request(rateFromEuroToDollarEndpoint).responseJSON { response in
            guard response.error == nil else {
                completion(0)
                return
            }
            
            let json = try! JSON(data: response.data!)
            completion(json["rates"]["USD"].doubleValue)
        }
    }
}
