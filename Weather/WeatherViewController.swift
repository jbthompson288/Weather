//
//  WeatherViewController.swift
//  Weather
//
//  Created by JB Thompson on 9/8/16.
//  Copyright © 2016 JB Thompson. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            WeatherController.weatherBySearchCity(searchText, completion: { (result) in
                guard let weatherResult = result else { return }
                
                DispatchQueue.main.async { () in
                    self.cityNameLabel.text = weatherResult.cityName
                    if let temperatureC = weatherResult.temperatureC {
                        self.temperatureLabel.text = String(temperatureC) + "°C"
                    } else {
                        self.temperatureLabel.text = "No temperature available"
                    }
                    self.mainLabel.text = weatherResult.main
                    self.descriptionLabel.text = weatherResult.description
                }
            })
        }
        
        searchBar.resignFirstResponder()
    }
}
