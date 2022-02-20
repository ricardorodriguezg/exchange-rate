//
//  APIError.swift
//  ExchangeRate
//
//  Created by Alonso Rodriguez on 20/02/22.
//

import Foundation

import Foundation

enum APIError : Error {
    
    case connectivityError
    case conflictError(code: String)
}
