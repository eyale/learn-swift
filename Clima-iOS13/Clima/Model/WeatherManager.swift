//
//  WeatherManager.swift
//  Clima
//
//  Created by Anton Goncharov on 26.05.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherManager {
    //    var urlComponents = URLComponents()
    //    urlComponents.scheme = "https"
    //    urlComponents.host = "pokeapi.co"
    //    urlComponents.path = "/api/v2/pokemon/\(id)"
    //    return urlComponents.url!
    let url = "https://api.openweathermap.org/data/2.5/weather?appid=88dfe612a9b31f32b091650395a238e1&units=metric"
    let iconName = "sun.min"
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String, units: String) {
        let urlString = "\(url)&q=\(cityName)"
        performRequest(with: urlString)
    }
    func fetchWeather(lat: CLLocationDegrees, long: CLLocationDegrees, units: String) {
        let urlString = "\(url)&lat=\(lat)&lon=\(long)"
        performRequest(with: urlString)
    }
    func performRequest(with url: String) {
        //        let arr = [0,1,2,3,4]
        //        print(arr.map { $0 + 1 })
        
        if let url = URL(string: url) {
            let urlSession = URLSession(configuration: .default)
            
            let task = urlSession.dataTask(with: url){ data, resp, error in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let city = decodedData.name
            let temp = decodedData.main.temp
            let id = decodedData.weather[0].id
            print(decodedData)
            
            let weather = WeatherModel(conditionId: id, cityName: city, temprature: temp)
            
            return weather
        } catch {
            self.delegate?.didFailWithError(error)
            return nil
        }
    }
}
