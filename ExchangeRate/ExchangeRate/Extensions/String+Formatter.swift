//
//  String+Formatter.swift
//  ExchangeRate
//
//  Created by Alonso Rodriguez on 19/02/22.
//

import Foundation

extension String {
    func formattedAmounToDouble() -> Double {
        let filtered = self.filter({ "0123456789".contains($0) })
        
        return (Double(filtered) ?? 0.0)/100
    }
}
