//
//  Article.swift
//  News
//
//  Created by Anton Goncharov on 27.03.2020.
//  Copyright © 2020 Anton Honcharov. All rights reserved.
//

import Foundation

/**
 {
 -"source": {
 "id": null,
 "name": "Newsbtc.com"
 },
 "author": "Guest Author",
 "title": "KuCoin’s Futures Platform KuMEX Launches USDT Perpetual Contracts",
 "description": "KuMEX, the Bitcoin futures platform developed by KuCoin, today announced that USDT Perpetual Contracts will be officially available on the exchange at around 18:00 on March 30, 2020 (UTC+8) and deposit of USDT has already been enabled. Unlike the Bitcoin (BTC…",
 "url": "https://www.newsbtc.com/2020/03/27/kucoins-futures-platform-kumex-launches-usdt-perpetual-contracts/",
 "urlToImage": "https://www.newsbtc.com/wp-content/uploads/2020/03/Kumex-Kucoin-1200x780.png",
 "publishedAt": "2020-03-27T07:25:43Z",
 "content": "KuMEX, the Bitcoin futures platform developed by KuCoin, today announced that USDT Perpetual Contracts will be officially available on the exchange at around 18:00 on March 30, 2020 (UTC+8) and deposit of USDT has already been enabled.\r\nUnlike the Bitcoin (BT… [+1502 chars]"
 }
 */

struct Article {
    var source: String
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var content: String
    
    init(dictionary: Dictionary<String, Any>) {
        source = (dictionary["source"] as? Dictionary<String, Any> ?? ["": ""])["name"] as? String ?? ""
        author = dictionary["author"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        urlToImage = dictionary["urlToImage"] as? String ?? ""
        publishedAt = dictionary["publishedAt"] as? String ?? ""
        content = dictionary["content"] as? String ?? ""
    }
}
