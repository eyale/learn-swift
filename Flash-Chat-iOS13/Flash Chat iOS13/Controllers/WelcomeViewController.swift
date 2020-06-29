//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.charInterval = 0.07
        titleLabel.text = K.appName
        //        let titleText = Array(K.appName)
        //        titleLabel.text = ""
        //
        //        titleText.reduce(into: 0.0) {index, letter in
        //            Timer.scheduledTimer(withTimeInterval: 0.1 * index, repeats: false) { (Timer) in
        //                self.titleLabel.text?.append(letter)
        //            }
        //            index += 1
        //        }
    }
}
