//
//  SecondViewController.swift
//  PassDataProject
//
//  Created by Anton Goncharov on 08.04.2020.
//  Copyright © 2020 Anton Honcharov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var login: String = "Hello"
    
    @IBOutlet var label: UILabel!
    @IBAction func sendHandler(button: UIButton) {
        performSegue(withIdentifier: "unwindSecondView", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(login)
        label.text = "Hello \(login)"
    }
}
