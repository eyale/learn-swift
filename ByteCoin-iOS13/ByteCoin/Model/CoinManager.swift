//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(_ coinManager: CoinManager, coin: CoinModel)
    func didFailWithError(_ error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "62873F65-675D-47C4-A310-A97D11C50B27"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD", "UAH", "USD","ZAR"]
    var delegate: CoinManagerDelegate?

    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }

    func performRequest(with url: String) {
        if let url = URL(string: url) {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { data,response,error in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }

                if let safeData = data {
                    if let coin = self.parseJSON(safeData) {
                        self.delegate?.didUpdateCoin(self, coin: coin)
                    }
                }
            }
            task.resume()
        }
    }

    func parseJSON(_ coinData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let currency = decodedData.asset_id_quote
            let rate = decodedData.rate
            let coin = CoinModel(currency: currency, rate: rate)

            return coin
        } catch {
            self.delegate?.didFailWithError(error)
            return nil
        }
    }
    
}
