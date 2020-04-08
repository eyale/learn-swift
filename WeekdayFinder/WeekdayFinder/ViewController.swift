//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by Anton Goncharov on 05.04.2020.
//  Copyright © 2020 Anton Honcharov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var weekDayResult: UILabel!
    
    @IBAction func findWeekDay() {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        
        guard let day = dayTF.text, let month = monthTF.text, let year = yearTF.text else {
            return
        }
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else {
            return
        }
        
        let weekDay = dateFormatter.string(from: date)
        print(weekDay)
        weekDayResult.text = weekDay
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

