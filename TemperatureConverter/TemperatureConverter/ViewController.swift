//
//  ViewController.swift
//  TemperatureConverter
//
//  Created by Anton Goncharov on 08.04.2020.
//  Copyright © 2020 Anton Honcharov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var celsiusL: UILabel!
    @IBOutlet var fahrenhitL: UILabel!
    @IBOutlet var sliderValue: UISlider! {
        didSet {
            sliderValue.maximumValue = 100
            sliderValue.minimumValue = -50
            sliderValue.value = 50
            sliderValue.maximumTrackTintColor = UIColor.red
            sliderValue.minimumTrackTintColor = UIColor.blue
        }
    }
    
    @IBAction func sliderChange(_ slider: UISlider) {
        let temperatureCelsius = Int(round(slider.value))
        
        celsiusL.text = "\(temperatureCelsius)ºC"
        
        let temperatureFahrenheit = Int(round((slider.value * 9 / 5) + 32))
        fahrenhitL.text = "\(temperatureFahrenheit)ºF"
    }

}

