//
//  Weather.swift
//  Weather
//
//  Created by JB Thompson on 9/8/16.
//  Copyright © 2016 JB Thompson. All rights reserved.
//

import Foundation


class Weather {
    
    let main = ""
    let desciption = ""
    let iconString = ""
    let temperatureK: Float?
    let cityName = ""
    let temperatureC: Float? {
        get {
            if let temperatureK = temperatureK {
                return temperatureK - 273.15
            } else {
                return nil
            }
        }
    }
    
    
    
    
}

//Using a sample endpoint, create an initWithJSON method. This will take one parameter, a dictionary, and create an initialized weather object. This will parse through the dictionary to set the Properties of a new Weather object.