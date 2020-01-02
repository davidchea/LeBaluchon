//
//  RateViewController.swift
//  LeBaluchon
//
//  Created by David Chea on 30/12/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import UIKit
import SwiftyJSON

class RateViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var euroTextField: UITextField!
    @IBOutlet weak var dollarTextField: UITextField!
    
    // MARK: - Action
    
    @IBAction func euroEditing() {
        FixerAPI.shared.getRateFromEuroToDollar(completionHandler: updateDollarTextField(_:))
    }
    
    // MARK: - Method
    
    private func updateDollarTextField(_ json: JSON) {
        guard json["error"] == JSON.null else {
            presentErrorAlert(message: json["error"].stringValue)
            return
        }
        
        guard let euro = Double(euroTextField.text!) else {
            dollarTextField.text = ""
            return
        }
        
        let USDRate = json["rates"]["USD"].doubleValue
        let dollar = euro * USDRate
        dollarTextField.text = dollar.description
    }
}
