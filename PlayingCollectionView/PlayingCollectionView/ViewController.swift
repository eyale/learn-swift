//
//  ViewController.swift
//  PlayingCollectionView
//
//  Created by Anton Goncharov on 17.04.2020.
//  Copyright © 2020 Anton Honcharov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var datePicker: UIDatePicker!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

    datePicker.datePickerMode = UIDatePicker.Mode.date
    datePicker.minimumDate = Date()
    //    datePicker.date = Date()

    datePicker.subviews[0].subviews[0].subviews[1].isHidden = true
  }
  @IBAction func onChangeDatePicker(_ sender: UIDatePicker) {
    print(sender.date)
  }
}
