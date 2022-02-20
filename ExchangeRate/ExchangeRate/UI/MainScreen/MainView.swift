//
//  MainView.swift
//  ExchangeRate
//
//  Created by Alonso Rodriguez on 19/02/22.
//

import SwiftUI
import Combine

struct MainView: View {
    
    @ObservedObject var viewModel = ServiceLocator.providerMainViewModel()
    
//    let formatter: NumberFormatter = {
//            let formatter = NumberFormatter()
//            formatter.numberStyle = .decimal
//            return formatter
//        }()

    var body: some View {
        ZStack{
            
        
        VStack{
            ScrollView(showsIndicators: false){
                
                Spacer()
                Image("imgLogoBCP")
                    .resizable()
                    .aspectRatio(180/110.0, contentMode: .fit)
                    .frame(maxHeight: 100)
                
                HStack(spacing:0){
                    VStack(alignment:.leading){
                        VStack(alignment:.leading,spacing: 4){
                            Text("Tú envías:")
                                .textStyle(LabelTextStyle())
                            TextField("0.00",value: $viewModel.amountToSendText,format:.number).textFieldStyle(TextFieldStylePrimary())
                                .keyboardType(.decimalPad)
                        }.padding(.horizontal,16)
                        Divider()
                        VStack(alignment:.leading,spacing: 4){
                            Text("Tú recibes:")
                                .textStyle(LabelTextStyle())
                            Text(viewModel.amountToReceiveText).textStyle(LabelTextBoldStyle())
                            
                        }.padding(.horizontal,16)
                    }
                    ShuffleButton
                }.background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 3)
                    .padding(24)
                
                SectionTC
                
                
                Button("Empieza tu operación") {
                    viewModel.handleOperation()
                    
                    
                }.buttonStyle(PrimaryButton())
                    .disabled(!viewModel.canSubmit).padding(24)
                
               
                
            }
            
            
        }.onAppear {
            viewModel.onAppear()
        }
            if viewModel.isLoading{
                LoadingView()
            }
        }
    }
    
    var ShuffleButton : some  View{
        ZStack{
            
            VStack(alignment:.leading,spacing:1){
                HStack(spacing: 0){
                    
                    Text(viewModel.listCurrencySelected.first?.name ?? "")
                        .textStyle(LabelTextBoldStyle(foregroundColor: .white, size: 16))
                        .frame(width:60,alignment: .center)
                        .padding()
                    
                }.padding(10)
                    .background(Color("ColorPrimary"))
                
                VStack(alignment:.leading,spacing: 0){
                    
                    Text(viewModel.listCurrencySelected.last?.name ?? "")
                        .textStyle(LabelTextBoldStyle(foregroundColor: .white, size: 16))
                        .frame(width:60,alignment: .center)
                        .padding()
                }.padding(10)
                    .background(Color("ColorPrimary"))
            }
            
            HStack(spacing: 0){
                
                Image(systemName: "shuffle.circle")
                    .resizable()
                    .frame(width: 38, height: 38, alignment: .trailing)
                    .foregroundColor(.white)
            }
            
            
        }.onTapGesture {
            viewModel.handleShuffle()
        }
    }
    
    var SectionTC : some View{
        Text("Compra: \(viewModel.buyValue) | Venta: \(viewModel.sellValue)").textStyle(LabelTextStyle(foregroundColor: Color("ColorPrimary"), size: 16))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
