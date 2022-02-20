//
//  LoadingView.swift
//  ExchangeRate
//
//  Created by Alonso Rodriguez on 20/02/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.orange))
                .scaleEffect(2, anchor: .center)
        }
    }
}
