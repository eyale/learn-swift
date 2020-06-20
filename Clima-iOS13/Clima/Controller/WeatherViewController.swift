//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    let units = ["metric", "imperial", "standart"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        weatherManager.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        //      conditionImageView.image = weatherManager
    }
}
//MARK: - hideKeyboardWhenTappedAround
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchHandler(_ sender: UIButton) {
        print(searchTextField.text!)
        // self.hideKeyboardWhenTappedAround()
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // self.hideKeyboardWhenTappedAround()
        searchTextField.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != "" {
            return true
        } else {
            searchTextField.placeholder = "Type something..."
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let city = textField.text else { return }
        weatherManager.fetchWeather(cityName: city, units: units[0])
        searchTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = "\(weather.tempratureString)"
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    func  didFailWithError(_ error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude
            print("lat: \(lat), long: \(long)")
            weatherManager.fetchWeather(lat: lat, long: long, units: units[0])
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("locationManager error:: \(error.localizedDescription)")
    }
    @IBAction func getCurrentLocation(_ sender: UIButton) {
        locationManager.requestLocation()
    }
}
