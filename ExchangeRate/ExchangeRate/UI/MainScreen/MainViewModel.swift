//
//  MainViewModel.swift
//  ExchangeRate
//
//  Created by Alonso Rodriguez on 19/02/22.
//

import SwiftUI
import Combine

class MainViewModel : ObservableObject{
    
    //Datos por defecto
    private let symbolSend = "USD"
    private let symbolReceive = "PEN"
    
    private var exchangeRateRepository : ExchangeRateRepository
    
    init(exchangeRateRepository : ExchangeRateRepository) {
        self.exchangeRateRepository = exchangeRateRepository
    }
    
    @Published var amountToSendText = 1.0{
        didSet{
            self.calculateAmoutByCurrency()
        }
    }

    @Published var amountToReceiveText = "0.00"
   
    @Published var buyValue : String = "0.0"
    @Published var sellValue : String = "0.0"

    @Published var canSubmit = false
    @Published var isLoading = false
    
    var listCurrencySelected : [Currency] = []
    private var cancellableSet : Set<AnyCancellable> = []
    
    func onAppear(){
        
        $amountToSendText.map { amount in
            return amount > 0
        }
        .assign(to: \.canSubmit, on : self)
        .store(in: &cancellableSet)
        
        getDataFromLocal()
        
        calculateExchanngeRate(symbolSend: symbolSend, symbolReceive: symbolReceive)
        
        calculateAmoutToReceive()
        
    }
    
    private func getDataFromLocal(){
        
        isLoading = true
        self.exchangeRateRepository.getData { [weak self] result in
            
            self?.isLoading = false
            switch result{
            case .success(let response):
                if let data = response?.body{
                    //filtramos por las dos monedas por defecto
                    if let currencySend = data.first(where: { c in
                        c.symbol == self?.symbolSend
                    }){
                        self?.listCurrencySelected.append(currencySend)
                    }
                    
                    if let currencyReceive = data.first(where: { c in
                        c.symbol == self?.symbolReceive
                    }){
                        self?.listCurrencySelected.append(currencyReceive)
                    }
                }
            case .failure(_):
                break
            }
        }
    }
    
    func calculateExchanngeRate(symbolSend : String, symbolReceive : String){
        
        let currencySend = listCurrencySelected.first

        let factorSend = currencySend?.listCurrency.first(where: { v in
            v.symbol == symbolReceive
        })?.factor
        
        let currencyReceive = listCurrencySelected.last

        let factorReceive = currencyReceive?.listCurrency.first(where: { v in
            v.symbol == symbolSend
        })?.factor
        
        guard let valueFactorSend = factorSend else{
            return
        }
        
        guard let valueFactorReceive = factorReceive else{
            return
        }
        
        if valueFactorSend > valueFactorReceive{
            self.buyValue = String(format: "%.2f", valueFactorSend)
            self.sellValue = String(format: "%.2f", 1/valueFactorReceive)
        }
        else{
            self.buyValue = String(format: "%.2f", valueFactorReceive)
            self.sellValue = String(format: "%.2f", 1/valueFactorSend)
        }

    }
   
    func calculateAmoutToReceive(){
       
        let symbolReceive = listCurrencySelected.last!.symbol
        let currencySend = listCurrencySelected.first
        
        let factorSend = currencySend?.listCurrency.first(where: { v in
            v.symbol == symbolReceive
        })?.factor
        
        guard let valueFactorSend = factorSend else{
            return
        }
        
        let doubleValue = amountToSendText * valueFactorSend
        amountToReceiveText = String(format: "%.2f", doubleValue)
    }
    
    func handleShuffle(){
        listCurrencySelected.reverse()
        calculateAmoutToReceive()
    }
    
    func handleOperation(){
        
    }
}




