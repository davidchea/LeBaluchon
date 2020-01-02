//
//  FixerAPI.swift
//  LeBaluchon
//
//  Created by David Chea on 31/12/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import Alamofire
import SwiftyJSON

class FixerAPI: API {
    
    // MARK: - Properties
    
    static let shared = FixerAPI()
    private let baseEndpoint = "http://data.fixer.io/api/latest?access_key=363596384dd4e74590948b5c03bc8784"
    
    // MARK: - Method
    
    func getRateFromEuroToDollar(completionHandler: @escaping (JSON) -> Void) {
        cancelAllTasks()
        
        let parameters = ["base": "EUR", "symbols": "USD"]
        Alamofire.request(baseEndpoint, parameters: parameters).responseJSON { dataResponse in
            guard dataResponse.error == nil else {
                completionHandler(JSON(["error": dataResponse.error!.localizedDescription]))
                return
            }
            
            let json = try! JSON(data: dataResponse.data!)
            completionHandler(json)
        }
    }
}
