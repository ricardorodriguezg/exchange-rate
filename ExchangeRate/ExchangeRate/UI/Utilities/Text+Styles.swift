//
//  Text+Styles.swift
//  ExchangeRate
//
//  Created by Alonso Rodriguez on 19/02/22.
//

import SwiftUI

extension Text {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}
