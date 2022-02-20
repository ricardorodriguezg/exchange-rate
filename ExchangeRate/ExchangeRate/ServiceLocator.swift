//
//  ServiceLocator.swift
//  ExchangeRate
//
//  Created by Alonso Rodriguez on 20/02/22.
//

import Foundation

class ServiceLocator{
    // MARK: - View Model
    static func providerMainViewModel() -> MainViewModel {
        return MainViewModel(exchangeRateRepository: provideExchangeRepository())
    }
    
    // MARK: - Repository
    static func provideExchangeRepository() -> ExchangeRateRepository {
        return ExchangeRateRepository(apiClient: provideExchangeRateAPI())
    }
    
    // MARK: - API Client
    static func provideExchangeRateAPI() -> ExchangeRateAPI {
        return ExchangeRateAPI()
    }
}
