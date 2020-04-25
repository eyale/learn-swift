//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageOne: UIImageView!
    @IBOutlet weak var diceImageTwo: UIImageView!
    
    let diceLiteralImages = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix") ]
    var diceNumberOne = 0
    var diceNumberTwo = 5

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func rollBtn(_ sender: UIButton) {
        diceImageOne.image = diceLiteralImages.randomElement()
        diceImageTwo.image = diceLiteralImages.randomElement()
    }
    

}

