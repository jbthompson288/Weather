//
//  NetworkController.swift
//  Weather
//
//  Created by JB Thompson on 9/10/16.
//  Copyright © 2016 JB Thompson. All rights reserved.
//

import Foundation

class NetworkController {
    
    
    //My Key "6655372855271beb3bde26192b15990c"
    
    fileprivate static let API_KEY = "6655372855271beb3bde26192b15990c"
    static let baseURL = "http://api.openweathermap.org/data/2.5/weather"
    
    static func searchURLByCity(_ city: String) -> URL {
        let escapedCityString = city.addingPercentEncoding(withAllowedCharacters: CharacterSet())
        
        return URL(string: baseURL + "?q=\(escapedCityString!)" + "&appid=\(API_KEY)")!
    }
    
    static func urlForIcon(_ iconString: String) -> URL {
        return URL(string: "http://openweathermap.org/img/w/\(iconString).png")!
    }
    
    static func dataAtURL(_ url: URL, completion: @escaping (_ resultData: Data?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) in
            guard let data = data  else {
                print(error?.localizedDescription)
                completion(nil)
                return
            }
            completion(data)
        }) 
        task.resume()
    }
}

