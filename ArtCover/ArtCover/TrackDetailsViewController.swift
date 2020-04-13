//
//  TrackDetailsViewController.swift
//  ArtCover
//
//  Created by Anton Goncharov on 13.04.2020.
//  Copyright © 2020 Anton Honcharov. All rights reserved.
//

import UIKit

class TrackDetailsViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!

    var trackName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = UIImage(named: trackName)
        trackTitle.text = trackName
        trackTitle.numberOfLines = 0
    }
}
