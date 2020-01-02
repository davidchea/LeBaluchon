//
//  WeatherViewController.swift
//  LeBaluchon
//
//  Created by David Chea on 02/01/2020.
//  Copyright © 2020 David Chea. All rights reserved.
//

import UIKit
import SwiftyJSON

class WeatherViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var parisTemperature: UILabel!
    @IBOutlet weak var parisWeather: UILabel!
    
    @IBOutlet weak var newYorkTemperature: UILabel!
    @IBOutlet weak var newYorkWeather: UILabel!
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
    }
    
    // MARK: - Methods
    
    private func getWeather() {
        WeatherAPI.shared.getWeather("2988507,5128581", completionHandler: updateLabels(_:error:))
    }
    
    private func updateLabels(_ json: JSON, error: String) {
        activityIndicatorView.stopAnimating()
        
        guard error == "" else {
            presentErrorAlert(message: error)
            return
        }
        
        parisTemperature.text = String(json["list"][0]["main"]["temp"].intValue) + " °C"
        parisWeather.text = json["list"][0]["weather"][0]["main"].stringValue
        
        newYorkTemperature.text = String(json["list"][1]["main"]["temp"].intValue) + " °C"
        newYorkWeather.text = json["list"][1]["weather"][0]["main"].stringValue
    }
}
