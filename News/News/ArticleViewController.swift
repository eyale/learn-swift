//
//  ArticleViewController.swift
//  News
//
//  Created by Anton Goncharov on 27.03.2020.
//  Copyright © 2020 Anton Honcharov. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    var article: Article!
    
    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var textTitle: UILabel!
    @IBOutlet weak var textDescription: UILabel!
    @IBAction func openInBrowser(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textTitle.text = article.title
        textDescription.text = article.description
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
