//
//  WeatherController.swift
//  Weather
//
//  Created by JB Thompson on 9/10/16.
//  Copyright © 2016 JB Thompson. All rights reserved.
//

import Foundation
import UIKit

class WeatherController {
    
    static func weatherBySearchCity(_ city: String, completion: @escaping (_ result: Weather?) -> Void) {
        
        let url = NetworkController.searchURLByCity(city)
        
        NetworkController.dataAtURL(url) { (resultData) in
            
            guard let resultData = resultData else { completion(nil); return }
        
            do {
                let weatherAnyObject = try JSONSerialization.jsonObject(with: resultData, options: .allowFragments)
                
                var weatherModelObject: Weather?
                if let weatherDictionary = weatherAnyObject as? [String: AnyObject] {
                    weatherModelObject = Weather(jsonDictionary: weatherDictionary)
                }
                completion(weatherModelObject)
                
            } catch {
                completion(nil)
            }
        }
    }
}
