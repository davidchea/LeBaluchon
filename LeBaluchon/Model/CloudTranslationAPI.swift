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
    private let translationToEnglishEndpoint = "https://translation.googleapis.com/language/translate/v2?target=en&key=AIzaSyDxULRQOeWgJO_HVMPrmhXHVcg68XYWnp0&q="
    
    // MARK: - Method
    
    func getTranslationToEnglish(_ text: String, completionHandler: @escaping (String, String) -> Void) {
        cancelAllTasks()
        
        // Replace all the spaces by encoding percents in the URL
        let completeEndpoint = translationToEnglishEndpoint + text
        let percentEncodingEndpoint = completeEndpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        Alamofire.request(percentEncodingEndpoint).responseJSON { dataResponse in
            guard dataResponse.error == nil else {
                completionHandler("", dataResponse.error!.localizedDescription)
                return
            }
            
            let json = try! JSON(data: dataResponse.data!)
            completionHandler(json["data"]["translations"][0]["translatedText"].stringValue, "")
        }
    }
}
