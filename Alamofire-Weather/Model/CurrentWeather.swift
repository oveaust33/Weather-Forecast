//
//  ChatController.swift
//  InstagramFull
//
//  Created by Iftiquar Ahmed  on 3/31/19.
//  Copyright © 2019 Iftiquar Ahmed . All rights reserved.
//

import Foundation
class CurrentWeather {
    
    let temperature: Double?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    let icon: String?
   
    
    struct WeatherKeys {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
        static let icon = "icon"

    }
    
    init(weatherDictionary: [String : Any])
    {
        self.temperature = weatherDictionary[WeatherKeys.temperature] as? Double
        
        if let humidityDouble = weatherDictionary[WeatherKeys.humidity] as? Double {
            self.humidity = Int(humidityDouble * 100)
        } else {
            self.humidity = nil
        }
        
        if let precipDouble = weatherDictionary[WeatherKeys.precipProbability] as? Double {
            self.precipProbability = Int(precipDouble * 100)
        } else {
            self.precipProbability = nil
        }
        
        self.summary = weatherDictionary[WeatherKeys.summary] as? String
        self.icon = weatherDictionary[WeatherKeys.icon] as? String
        
    }

}
