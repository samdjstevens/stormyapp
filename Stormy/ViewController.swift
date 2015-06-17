//
//  ViewController.swift
//  Stormy
//
//  Created by Sam Stevens on 13/06/2015.
//  Copyright © 2015 Sam Stevens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var currentHumidityLabel: UILabel?
    @IBOutlet weak var currentPrecipitationLabel: UILabel?
    @IBOutlet weak var currentWeatherIcon: UIImageView?
    @IBOutlet weak var refreshButton: UIButton?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    private let forecastAPIKey: String = "de1cecef56648dc6cc9fe04ac30b5a8e"
    
    let coordinate: (lat: Double, long: Double) = (53.475107, -2.23819)
    
    
    
    var baseURL : NSURL?
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        
     
        retrieveWeatherForecast()
    }
    
    @IBAction func refreshWeatherForecast() {
        retrieveWeatherForecast()
    }
    
    func toggleRefreshAnimation(on: Bool) {
        refreshButton?.hidden = on
        
        if on {
            activityIndicator?.startAnimating()
        } else {
            activityIndicator?.stopAnimating()
        }
    }
    
    func retrieveWeatherForecast() {
        
        toggleRefreshAnimation(true)
        
        let forecastService = ForecastService(apiKey: self.forecastAPIKey)
        forecastService.getForecast(coordinate.lat, long: coordinate.long) { (let currently) -> Void in
            
            
            if let currentWeather = currently {
                
                // Update UI
                dispatch_async(dispatch_get_main_queue()) {
                    // Execute closure on the main thread
                    
                    if let temperature = currentWeather.temperature {
                        self.currentTemperatureLabel?.text = "\(temperature)º"
                    }
                    
                    if let humidity = currentWeather.humidity {
                        self.currentHumidityLabel?.text = "\(humidity)%"
                    }
                    
                    if let precipProbability = currentWeather.precipProbability {
                        self.currentPrecipitationLabel?.text = "\(precipProbability)%"
                    }
                    
                    if let icon = currentWeather.icon {
                        self.currentWeatherIcon?.image = icon
                    }
                    
                    self.toggleRefreshAnimation(false)
                    
                }
                
            }
            
        }
        
    }
}

