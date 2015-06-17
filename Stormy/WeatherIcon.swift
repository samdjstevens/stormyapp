//
//  WeatherIcon.swift
//  Stormy
//
//  Created by Sam Stevens on 17/06/2015.
//  Copyright © 2015 Sam Stevens. All rights reserved.
//

import Foundation
import UIKit

enum WeatherIcon : String {
    
    case ClearDay = "clear-day"
    case ClearNight = "clear-night"
    case Rain = "rain"
    case Snow = "snow"
    case Sleet = "sleet"
    case Wind = "wind"
    case Fog = "fog"
    case Cloudy = "cloudy"
    case PartlyCloudyDay = "partly-cloudy-day"
    case PartlyCloudyNight = "partly-cloudy-night"
    
    func getImage() -> UIImage? {
        
        return UIImage(named: self.rawValue)
        
    }
    
}