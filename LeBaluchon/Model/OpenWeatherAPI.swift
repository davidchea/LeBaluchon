//
//  OpenWeatherAPI.swift
//  LeBaluchon
//
//  Created by David Chea on 01/01/2020.
//  Copyright © 2020 David Chea. All rights reserved.
//

import Alamofire
import SwiftyJSON

class OpenWeatherAPI: API {
    
    // MARK: - Properties
    
    static let shared = OpenWeatherAPI()
    private let baseEndpoint = "https://api.openweathermap.org/data/2.5/group?appid=8d38e085c21cc46d8d4acdc6787d78d4"
    
    // MARK: - Method
    
    func getWeather(_ cityIDs: String, completionHandler: @escaping (JSON) -> Void) {
        cancelAllTasks()
        
        let parameters = ["id": cityIDs, "units": "metric"]
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
