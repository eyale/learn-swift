//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var coinManager = CoinManager()

    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var bitcoinCurrencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
    }
}

//MARK: - CoinManagerDelegate
extension ViewController: CoinManagerDelegate {
    func didUpdateCoin(_ coinManager: CoinManager, coin: CoinModel) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = "\(coin.rate)"
            self.bitcoinCurrencyLabel.text = coin.currency
        }
    }
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

//MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}

//MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.getCoinPrice(for: coinManager.currencyArray[row])
    }
}

