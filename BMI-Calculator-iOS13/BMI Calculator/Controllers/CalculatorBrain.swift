//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Anton Goncharov on 11.05.2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func formatValue(_ precision: Int,_ val: Float) -> String {
        return String(format: "%.\(precision)f", val)
    }
    func calculateColor(_ value: Float) -> UIColor {
        switch value {
        case 0..<18.5:
            return #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        case 18.5..<24.5:
            return #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        case 24.5..<29.5:
            return #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        case 29.5..<39.5:
            return #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        case 39.5..<100000:
            return #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        default:
            return #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
        }
    }
    
    func calculateLabel(_ value: Float) -> String {
        switch value {
        case 0..<18.5:
            return "You need eat a healthy food with more protein, to gain more muscles"
        case 18.5..<24.5:
            return "You are in good form"
        case 24.5..<29.5:
            return "You need more excercise and eat less, to get in shape"
        case 29.5..<100000:
            return "You need a plan to get in shape, as soon as possible!"
        default:
            return "Ok. It was funny :)"
        }
    }
    
    mutating func calculateBMI(_ weight: Float, _ height: Float) {
        let bmiValue = weight / pow(height, 2)
        let color = calculateColor(bmiValue)
        let label = calculateLabel(bmiValue)
        
        bmi = BMI(value: bmiValue, label: label, color: color)
    }
    func getBMIValue() -> String {
        return formatValue(2, bmi?.value ?? 0.0)
    }
    func getBMIColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
    }
    func getBMILabel() -> String {
        return bmi?.label ?? "No advice :("
    }
}
