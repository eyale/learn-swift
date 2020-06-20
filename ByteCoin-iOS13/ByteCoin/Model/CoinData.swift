//
//  CoinData.swift
//  ByteCoin
//
//  Created by Anton Goncharov on 13.06.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    var time: String
    var asset_id_base: String
    var asset_id_quote: String
    var rate: Float
}
