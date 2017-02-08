//
//  Weather.swift
//  Weather
//
//  Created by JB Thompson on 9/8/16.
//  Copyright © 2016 JB Thompson. All rights reserved.
//

import Foundation


class Weather {
    
    static let weatherKey = "weather"
    static let mainKey = "main"
    static let descriptionKey = "desciption"
    static let iconKey = "icon"
    static let temperatureKey = "temp"
    static let nameKey = "name"
    
    var main = ""
    var description = ""
    var iconString = ""
    var temperatureK: Float?
    var cityName = ""
    var temperatureC: Float? {
        get {
            if let temperatureK = temperatureK {
                return temperatureK - 273.15
            } else {
                return nil
            }
        }
    }
    
    init(jsonDictionary: [String: AnyObject]) {
        
        if let arrayUsingWeatherKey = jsonDictionary[Weather.weatherKey] as? [[String: AnyObject]] {
//            self.main = arrayUsingWeatherKey[0][Weather.mainKey] as? String ?? "" is another option
            
            if let main = arrayUsingWeatherKey[0][Weather.mainKey] as? String {
                self.main = main
            }
            // 
            if let description = arrayUsingWeatherKey[0][Weather.descriptionKey] as? String {
                self.description = description
            }
            if let iconString = arrayUsingWeatherKey[0][Weather.iconKey] as? String {
                self.iconString = iconString
            }
        }
        
        if let main = jsonDictionary[Weather.mainKey] as? [String: AnyObject] {
            if let temperature = main[Weather.temperatureKey] as? NSNumber {
                self.temperatureK = Float(temperature)
            }
        }
        if let cityName = jsonDictionary[Weather.nameKey] as? String {
            self.cityName = cityName
        }
    }
}
