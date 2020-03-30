//
//  ArticleModel.swift
//  News
//
//  Created by Anton Goncharov on 27.03.2020.
//  Copyright © 2020 Anton Honcharov. All rights reserved.
//

import Foundation

// ToDo: on launch recalculate new newsURL with carrent date
// ToDo: adjust (if urlFile != nil) - condition with currentDate
class Variables {
    static let newsAPIDOTorgKey: String = "a043af83b2ef483b8362fcf292557608"
    static let newsURL = URL(string:
        "http://newsapi.org/v2/everything?q=bitcoin&from=2020-02-29&sortBy=publishedAt&apiKey=a043af83b2ef483b8362fcf292557608")
}

var articles: [Article] = []
var pathToArticlesInFS: URL {
    let usersLibraryPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
    let pathToFetchedJSON = URL(fileURLWithPath: usersLibraryPath)
    return pathToFetchedJSON
}

func fetchArticles(complitionHandler: (()->Void)?) {
    let session = URLSession(configuration: .default)
    let downloadTask = session.downloadTask(with: Variables.newsURL!) {(urlFile, Result, Error) in
        if urlFile != nil {
            try? FileManager.default.copyItem(at: urlFile!, to: pathToArticlesInFS)
            parseArticles()
//            NotificationCenter.default.post(<#T##notification: Notification##Notification#>)
            complitionHandler?()
        }
    }
    downloadTask.resume()
}

func parseArticles() {
    let data = try? Data(contentsOf: pathToArticlesInFS)
    if data == nil {
        return
    }
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        return
    }
    
    let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    if rootDictionaryAny == nil {
        return
    }
    
    if let articlesArray = rootDictionary!["articles"] as? [Dictionary<String, Any>] {
        var parsedArticles: [Article] = []
        for dict in articlesArray {
            let newArticle = Article(dictionary: dict)
            parsedArticles.append(newArticle)
        }
        articles = parsedArticles
    }
}
