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
        WeatherAPI.shared.getWeatherByCity("Paris", completionHandler: updateLabels(_:error:))
        WeatherAPI.shared.getWeatherByCity("New York", completionHandler: updateLabels(_:error:))
    }
    
    private func updateLabels(_ json: JSON, error: String) {
        activityIndicatorView.stopAnimating()
        
        guard error == "" else {
            presentErrorAlert(message: error)
            return
        }
        
        let city = json["name"].stringValue
        let temperature = json["main"]["temp"].intValue
        let weather = json["weather"][0]["main"].stringValue
        
        switch city {
        case "Paris":
            parisTemperature.text = temperature.description + " °C"
            parisWeather.text = weather
        case "New York":
            newYorkTemperature.text = temperature.description + " °C"
            newYorkWeather.text = weather
        default:
            break
        }
    }
}
