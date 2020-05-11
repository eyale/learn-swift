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
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        heightValue.text = "\(heightSlider.value)m"
        weightValue.text = "\(calculatorBrain.formatValue(0, weightSlider.value))Kg"
    }

    @IBAction func heightSliderHandler(_ sender: UISlider) {
        heightValue.text = "\(calculatorBrain.formatValue(2, heightSlider.value))m"

    }
    @IBAction func weightSliderHandler(_ sender: UISlider) {
        weightValue.text = "\(calculatorBrain.formatValue(0, weightSlider.value))Kg"
    }
    
    @IBAction func calculateHandler(_ sender: UIButton) {
        calculatorBrain.calculateBMI(weightSlider.value, heightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.bmiColor = calculatorBrain.getBMIColor()
            destinationVC.bmiAdvice = calculatorBrain.getBMILabel()
        }
    }
}

