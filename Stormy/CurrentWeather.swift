//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Sam Stevens on 13/06/2015.
//  Copyright © 2015 Sam Stevens. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeather {
    
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    var icon: UIImage? = UIImage(named: "default.png")
    
    init(weatherDictionary: [String: AnyObject]) {
        temperature = weatherDictionary["temperature"] as? Int
        
        if let humidityFloat = weatherDictionary["humidity"] as? Double {
            humidity = Int(humidityFloat * 100)
            
        } else {
            humidity = nil
        }
        
        
        if let precipProbabilityFloat = weatherDictionary["precipProbability"] as? Double {
            
            precipProbability = Int(precipProbabilityFloat * 100)
            
        } else {
            precipProbability = nil
        }
        
        summary = weatherDictionary["summary"] as? String
        
        if let weatherIconString = weatherDictionary["icon"] as? String {
            
            let weatherIcon = WeatherIcon(rawValue: weatherIconString)
            
            icon = weatherIcon!.getImage()
        }
    }
}