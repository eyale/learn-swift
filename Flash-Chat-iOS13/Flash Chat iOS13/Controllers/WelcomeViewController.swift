//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel
import IQKeyboardManagerSwift

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        IQKeyboardManager.shared.enable = true

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

//MARK: - hideKeyboardWhenTappedAround
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

