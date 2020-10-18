//
//  ViewController.swift
//  SegmentAdjusting
//
//  Created by Anton Goncharov on 29.07.2020.
//  Copyright © 2020 Anton Honcharov. All rights reserved.
//

import UIKit

class SegmentVC: UIViewController {
	@IBOutlet weak var segment: UISegmentedControl!

	@IBOutlet weak var recentContainerView: UIView!
	@IBOutlet weak var upcomingContainerView: UIView!

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		segment.setBackgroundImage(UIImage(named: "white"), for: .normal, barMetrics: .default)
		segment.setBackgroundImage(UIImage(ciImage: .cyan), for: .selected, barMetrics: .default)
		segment.layer.borderWidth = 1
		segment.layer.borderColor = UIColor(named: "seafoamBlue")?.cgColor
//		segment.backgroundColor = UIColor(named: "seafoamBlue")
//		segment.tintColor = UIColor(named: "seafoamBlue")
		segment.selectedConfiguration(font: UIFont(name: "Futura", size: 14)!, color: .white)
		segment.defaultConfiguration(font: UIFont(name: "Futura", size: 14)!, color: UIColor(named: "seafoamBlue")!)

		recentContainerView.alpha = 1
		upcomingContainerView.alpha = 0
	}

	@IBAction func didSegmentChange(_ sender: UISegmentedControl) {
		if sender.selectedSegmentIndex == 0 {
			recentContainerView.alpha = 1
			upcomingContainerView.alpha = 0
		}
		if sender.selectedSegmentIndex == 1 {
			upcomingContainerView.alpha = 1
			recentContainerView.alpha = 0
		}
	}

}


extension UISegmentedControl {
	func defaultConfiguration(font: UIFont = UIFont.systemFont(ofSize: 12), color: UIColor = UIColor.white)
    {
        let defaultAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color,
        ]

        setTitleTextAttributes(defaultAttributes, for: .normal)
    }

    func selectedConfiguration(font: UIFont = UIFont.boldSystemFont(ofSize: 12), color: UIColor = UIColor.red)
    {
        let selectedAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color
        ]
		backgroundColor = UIColor(named: "seafoamBlue")

        setTitleTextAttributes(selectedAttributes, for: .selected)
    }
}
