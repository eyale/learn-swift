//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by Anton Goncharov on 05.04.2020.
//  Copyright © 2020 Anton Honcharov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var dayTF: UITextField!
    @IBOutlet var monthTF: UITextField!
    @IBOutlet var yearTF: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func findDay() {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

