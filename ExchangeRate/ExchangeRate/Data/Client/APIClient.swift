//
//  APIClient.swift
//  ExchangeRate
//
//  Created by Alonso Rodriguez on 20/02/22.
//

import Foundation

class APIClient {
    
    func readLocalFile<T:Decodable>(forName name: String,completion: @escaping (Swift.Result<T?,APIError>)->Void){
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let decodedData = try JSONDecoder().decode(T.self,
                                                                      from: jsonData)
                completion(.success(decodedData))
            }
        } catch {
            print(error)
            completion(.failure(APIError.connectivityError))
           
        }
        
    }
}

