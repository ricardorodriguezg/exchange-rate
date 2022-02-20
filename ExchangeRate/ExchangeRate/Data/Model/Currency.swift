//
//  CurrencyModel.swift
//  ExchangeRate
//
//  Created by Alonso Rodriguez on 19/02/22.
//

import Foundation

struct Currency : Codable {
    let symbol : String
    let name : String
    let listCurrency : [ValuesExchangeRate]
}
