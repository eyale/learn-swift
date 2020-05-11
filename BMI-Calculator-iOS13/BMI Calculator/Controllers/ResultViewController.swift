//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Anton Goncharov on 11.05.2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
//    let calculatorBrain = CalculatorBrain()
    var bmiValue: String?
    var bmiColor: UIColor?
    var bmiAdvice: String?

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        background.backgroundColor = bmiColor
        adviceLabel.text = bmiAdvice
    }
    
    @IBAction func recalculateHandler(_ sender: UIButton) {
      self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
