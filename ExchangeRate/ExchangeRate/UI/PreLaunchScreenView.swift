//
//  PreLaunchScreenView.swift
//  ExchangeRate
//
//  Created by Alonso Rodriguez on 19/02/22.
//

import SwiftUI

struct PreLaunchScreenView: View {
    @State private var showMainView = false
    var body: some View {
        Group{
            if showMainView{
                MainView()
            }else{
                ZStack{
                    Image("imgLogoBCP")
                }
            }
        }.onAppear {
            withAnimation(.easeOut(duration: 0.5)){
                showMainView = true
            }
        }
        
    }
}

struct PreLaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        PreLaunchScreenView()
    }
}
