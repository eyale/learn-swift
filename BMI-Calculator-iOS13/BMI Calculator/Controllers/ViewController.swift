//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        heightValue.text = "\(heightSlider.value)m"
        weightValue.text = "\(formatValue(0, weightSlider.value))Kg"
    }
    
    func formatValue(_ precision: Int,_ val: Float) -> String {
        return String(format: "%.\(precision)f", val)
    }

    @IBAction func heightSliderHandler(_ sender: UISlider) {
        heightValue.text = "\(formatValue(2, heightSlider.value))m"

    }
    @IBAction func weightSliderHandler(_ sender: Any) {
        weightValue.text = "\(formatValue(0, weightSlider.value))Kg"
    }
    
    @IBAction func calculateHandler(_ sender: UIButton) {
        let bmi = weightSlider.value / pow(heightSlider.value, 2)
        
        let secondVC = ResultViewController()
        secondVC.bmiLabel.text = formatValue(2, bmi)
        self.present(secondVC, animated: true, completion: nil)
    }
}

