//
//  CloudTranslationAPI.swift
//  LeBaluchon
//
//  Created by David Chea on 01/01/2020.
//  Copyright © 2020 David Chea. All rights reserved.
//

import Alamofire
import SwiftyJSON

class CloudTranslationAPI: API {
    
    // MARK: - Properties
    
    static let shared = CloudTranslationAPI()
    private let baseEndpoint = "https://translation.googleapis.com/language/translate/v2?key=AIzaSyDxULRQOeWgJO_HVMPrmhXHVcg68XYWnp0"
    
    // MARK: - Method
    
    func getTranslationToEnglish(_ text: String, completionHandler: @escaping (JSON) -> Void) {
        cancelAllTasks()
        
        let parameters = ["q": text, "target": "en"]
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
