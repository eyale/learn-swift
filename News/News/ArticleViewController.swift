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
    @IBOutlet weak var imageLoader: UIActivityIndicatorView!
    @IBOutlet weak var articleCover: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleAuthor: UILabel!
    @IBOutlet weak var articleDate: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    @IBAction func openInBrower(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        articleTitle.text = article.title
        articleAuthor.text = article.author
        articleDate.text = article.publishedAt
        articleDescription.text = article.description
        self.imageLoader.hidesWhenStopped = true
        DispatchQueue.main.async {
            if let imageURL = URL(string: self.article.urlToImage) {
                if let imageData = try? Data(contentsOf: imageURL) {
                    self.articleCover.image = UIImage(data: imageData)
                } else {
                    self.imageLoader.stopAnimating()
                }
            }
        }
        
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
