//
//  ResponseBase.swift
//  ExchangeRate
//
//  Created by Alonso Rodriguez on 20/02/22.
//

import Foundation

struct ResponseBase<T:Codable> : Codable {
    let body : T
}
