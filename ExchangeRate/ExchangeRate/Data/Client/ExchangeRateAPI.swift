//
//  ExchangeRateAPI.swift
//  ExchangeRate
//
//  Created by Alonso Rodriguez on 20/02/22.
//

import Foundation

class ExchangeRateAPI : APIClient{
    
    func getDataFromLocal(completion: @escaping (Swift.Result<ResponseBase<[Currency]>?, APIError>)->Void){
        readLocalFile(forName: "Data", completion: completion)
    }
}
