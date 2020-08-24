//
//  WeatherManager.swift
//  Weather
//
//  Created by Lucy on 24/08/2020.
//

import Foundation

struct WeatherManager {
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?&appid=d6d5952f99011cdd4aa3638ca4c5c25b&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = ("\(weatherURL)&q=\(cityName)")
        print(urlString)
    }
}
