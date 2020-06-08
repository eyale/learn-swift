//
//  WeatherModel.swift
//  Clima
//
//  Created by Anton Goncharov on 30.05.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temprature: Double
    
    var tempratureString: String {
        return String(format: "%.0f", temprature)
    }
    
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...501:
            return "cloud.sun.rain"
        case 502...531:
            return "cloud.heavyrain"
        case 600...622:
            return "snow"
        case 701...771:
            return "smoke"
        case 771...781:
            return "tornado"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "sun"
        }
    }
    
}
