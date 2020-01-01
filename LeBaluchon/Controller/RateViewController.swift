//
//  RateViewController.swift
//  LeBaluchon
//
//  Created by David Chea on 30/12/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var euroTextField: UITextField!
    @IBOutlet weak var dollarTextField: UITextField!
    
    // MARK: - Action
    
    @IBAction func euroEditing() {
        FixerAPI.shared.getRateFromEuroToDollar(completionHandler: updateDollarTextField(_:))
    }
    
    // MARK: - Method
    
    private func updateDollarTextField(_ rate: Double) {
        guard let euro = Double(euroTextField.text!) else {
            dollarTextField.text = ""
            return
        }
        
        let dollar = euro * rate
        dollarTextField.text = dollar.description
    }
}
