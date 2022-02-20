//
//  ExchangeRateRepository.swift
//  ExchangeRate
//
//  Created by Alonso Rodriguez on 20/02/22.
//

import Foundation
struct ExchangeRateRepository {
    
    let apiClient: ExchangeRateAPI
    
    func getData(completion: @escaping (Swift.Result<ResponseBase<[Currency]>?, APIError>)->Void){
        apiClient.getDataFromLocal(completion: completion)
    }
}
