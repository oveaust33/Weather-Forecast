//
//  ChatController.swift
//  InstagramFull
//
//  Created by Iftiquar Ahmed  on 3/31/19.
//  Copyright © 2019 Iftiquar Ahmed . All rights reserved.
//

import UIKit

class CurrenWeatherViewController: UIViewController {

    @IBOutlet weak var cityTextLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureScaleLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var iconLabel: UIImageView!
    
    let forecastAPIKey = "ee28ca7182ebc10d1ebe6221b372b23b"
    let coordinate : (lat : Double , long : Double) = (23.7104, 90.40744)
    var forecastService: ForecastService!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getCurrentWeather(latitude: coordinate.lat, longitude: coordinate.long) { (currentWeather) in
            if let currentWeather = currentWeather {
                DispatchQueue.main.async {
                    if let temperature = currentWeather.temperature{
                        self.temperatureLabel.text = "\(temperature)°"
                    } else {
                        self.temperatureLabel.text = "__"
                    }
                    
                    if let icon = currentWeather.icon {
                        
                        self.iconLabel.image = UIImage(named: "\(icon)")
                    } else {
                        
                        self.iconLabel.image = UIImage(named: "logo")
                    }
 
                }
            }
        }
    }
}
