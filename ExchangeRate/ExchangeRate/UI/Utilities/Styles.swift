//
//  Styles.swift
//  ExchangeRate
//
//  Created by Alonso Rodriguez on 19/02/22.
//

import Foundation
import SwiftUI

// MARK: TextStyles

struct LabelTextStyle: ViewModifier {
    var foregroundColor : Color = Color("ColorLabelPrompt")
    var size : CGFloat = 14
    func body(content: Content) -> some View {
        content
            .font(.system(size: size))
            .foregroundColor(foregroundColor)
    }
}

struct LabelTextBoldStyle: ViewModifier {
    var foregroundColor : Color = Color("ColorPrimary")
    var size : CGFloat = 14
    func body(content: Content) -> some View {
        content
            .font(.system(size: size,weight:.bold))
            .foregroundColor(foregroundColor)
    }
}


// MARK: - TextField
struct TextFieldStylePrimary: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
            .font(.system(size: 14,weight:.bold))
            .foregroundColor(Color("ColorPrimary"))
        }
}


// MARK: - Button

struct PrimaryButton: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    PrimaryButtonStyleView(configuration: configuration)
  }
}
private extension PrimaryButton {
  struct PrimaryButtonStyleView: View {
    @Environment(\.isEnabled) var isEnabled
    let configuration: PrimaryButton.Configuration

    var body: some View {
      return configuration.label
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height:56)
        .background(isEnabled ? Color.blue : Color.gray.opacity(0.4))
        .foregroundColor(isEnabled ? Color.white : Color.black.opacity(0.7))
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .scaleEffect(configuration.isPressed ? 1.1 : 1)
        .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        
    }
  }
}
