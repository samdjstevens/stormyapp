//
//  ForecastService.swift
//  Stormy
//
//  Created by Sam Stevens on 14/06/2015.
//  Copyright © 2015 Sam Stevens. All rights reserved.
//

import Foundation

struct ForecastService {
    
    let apiKey: String
    let baseURL: NSURL?
    
    typealias ForecastCompletion = (CurrentWeather? -> Void)
    
    
    init(apiKey: String) {
        
        self.apiKey = apiKey
        self.baseURL = NSURL(string: "https://api.forecast.io/forecast/\(self.apiKey)/")
    }
    
    
    func getForecast(lat: Double, long: Double, completion: ForecastCompletion) {
        
        if let forecastQueryURL = NSURL(string: "\(lat),\(long)?units=si", relativeToURL: self.baseURL) {
            
            let networkOperation = NetworkOperation(url: forecastQueryURL)
            
            networkOperation.downloadJSONFromURL {
                (let jsonDictionary) in
                
                let currentWeather = self.currentWeatherFromJSONDictionary(jsonDictionary)
                
                completion(currentWeather)
                
                
            }
            
            
        } else {
            print("Could not construct a valid forecast URL.")
        }
        
    }
    
    
    func currentWeatherFromJSONDictionary(jsonDictionary: [String: AnyObject]?) -> CurrentWeather? {
        
        if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String: AnyObject] {
            
            return CurrentWeather(weatherDictionary: currentWeatherDictionary)
            
        } else {
            print("No current weather key/returned nil.")
            return nil
        }
    }
    
    
    
    
}