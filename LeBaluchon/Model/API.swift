//
//  API.swift
//  LeBaluchon
//
//  Created by David Chea on 01/01/2020.
//  Copyright © 2020 David Chea. All rights reserved.
//

import Alamofire

class API {
    
    // MARK: - Method
    
    func cancelAllTasks() {
        Alamofire.SessionManager.default.session.getAllTasks { URLSessionTasks in
            URLSessionTasks.forEach { $0.cancel() }
        }
    }
}
