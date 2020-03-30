//
//  PageViewController.swift
//  News
//
//  Created by Anton Goncharov on 28.03.2020.
//  Copyright © 2020 Anton Honcharov. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        
        self.showViewControllers()
        fetchArticles {
            self.showViewControllers()
        }
    }
    
    func showViewControllers() {
       
        DispatchQueue.main.async {
            if let vc = self.pageViewController(for: 0) {
                self.setViewControllers([vc], direction: .forward, animated: false, completion: nil)
            }
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as? ArticleViewController)?.index ?? 0) - 1
        return self.pageViewController(for: index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as? ArticleViewController)?.index ?? 0) + 1
        return self.pageViewController(for: index)
    }
    
    func pageViewController(for index: Int) -> ArticleViewController? {
        if index < 0 {
            return nil
        }
        if index >= articles.count {
            return nil
        }
        let vc = (storyboard?.instantiateViewController(withIdentifier: "articleSID") as! ArticleViewController)
        vc.article = articles[index]
        vc.index = index
        return vc
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
