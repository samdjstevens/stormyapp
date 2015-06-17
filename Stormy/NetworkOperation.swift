//
//  NetworkOperation.swift
//  Stormy
//
//  Created by Sam Stevens on 14/06/2015.
//  Copyright © 2015 Sam Stevens. All rights reserved.
//

import Foundation

class NetworkOperation {
    

    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    
    let queryURL: NSURL
    
    typealias JSONDictionaryCompletion = ([String: AnyObject]? -> Void)
    
    
    init(url: NSURL) {
        self.queryURL = url
    }
    
    func downloadJSONFromURL(completion: JSONDictionaryCompletion) {
  
        let request = NSURLRequest(URL: queryURL)
        let dataTask = session.dataTaskWithRequest(request) {
            (let data, let response, let error) in
            
            // 1. Check HTTP response for 200 status code
            if let httpResponse = response as? NSHTTPURLResponse {
                
                switch httpResponse.statusCode {
                
                case 200:
                    
                    // 2. Create JSON object with data
                    
                    do {
                        
                        let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? [String: AnyObject]
                        
                        completion(jsonDictionary)

                        
                    } catch {
                        print("An exception was encountered.")
                    }
                    
                    
                    
                default:
                    print("Error: non 200 HTTP status code")
                
                }
                
                
            } else {
                print("Error: not a valid HTTP response.")
            }
            
        }
        
        dataTask!.resume()
        
        
        
    }
}