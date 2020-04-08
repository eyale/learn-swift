//
//  ViewController.swift
//  PassDataProject
//
//  Created by Anton Goncharov on 08.04.2020.
//  Copyright © 2020 Anton Honcharov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var isSegueied: UILabel!
    
    @IBAction func sendHandler() {
        guard let login = loginTF.text, let password = passwordTF.text else {
            return
        }
        print("sendHandler Login: \(login), Password: \(password)")
        performSegue(withIdentifier: "secondView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? SecondViewController, let login = loginTF.text else {
            return
        }
        dvc.login = login
    }
    
    @IBAction func unwindToLoginScreen(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSecondView" else { return }
        guard let svc = segue.source as? SecondViewController else { return }
        self.isSegueied.text = svc.label.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }


}

