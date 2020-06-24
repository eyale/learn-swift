//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        self.hideKeyboardWhenTappedAround()
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let e = error {
                    let alert = UIAlertController(title: "Error!", message: e.localizedDescription, preferredStyle: .actionSheet)
                    let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)

                    alert.addAction(alertAction)
                    self.present(alert, animated: true)
                } else {
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
            }
        }
    }
}


