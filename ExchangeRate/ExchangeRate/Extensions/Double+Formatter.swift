//
//  Double+Formatter.swift
//  ExchangeRate
//
//  Created by Alonso Rodriguez on 19/02/22.
//

import Foundation

extension Double {
    func formatAmount(groupingSeparator: String = ",") -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.decimalSeparator = "."
        formatter.groupingSeparator = groupingSeparator
        
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
    
}
