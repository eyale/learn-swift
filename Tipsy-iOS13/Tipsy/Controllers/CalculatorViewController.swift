//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

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

class CalculatorViewController: UIViewController {

    var selectedTip: Double?
    var tips: String?
    var peopleCount: Float?
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentBtn: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var splitNumberLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        tenPercentButton.isSelected = true
        selectedTip = 0.1
        splitNumberLabel.text = String(Int(stepper.value))
    }

    @IBAction func tipHandler(_ sender: UIButton) {

        zeroPercentBtn.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        sender.isSelected = true
        
        if sender.currentTitle == zeroPercentBtn.currentTitle {
            selectedTip = 0.0
        } else if sender.currentTitle == tenPercentButton.currentTitle {
            selectedTip = 0.1
        } else if sender.currentTitle == twentyPercentButton.currentTitle {
            selectedTip = 0.2
        }
    }
    @IBAction func stepperHandler(_ sender: UIStepper) {
        print("stepperHandler - \(sender.value)")
        splitNumberLabel.text = String(Int(stepper.value))
    }
    @IBAction func calculateBtnHandler(_ sender: UIButton) {
        
        if let bill = Float(billTextField.text!) {
            peopleCount = Float(stepper.value)

            let tips = (bill * Float(selectedTip!) + bill) / peopleCount! // My Decision
//            let tips = (bill * (1 + Float(selectedTip!))) / peopleCount // Teacher's Decision
            
            print("tips \(tips)")
            self.tips = String(format: "%.2f", tips)
            self.performSegue(withIdentifier: "resultSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            let resultView = segue.destination as! ResultsViewController
            
            resultView.tips = self.tips
            resultView.selectedTip = Int(self.selectedTip! * 100)
            resultView.peopleCount = Int(self.peopleCount!)
        }
    }
    
}

