//
//  CurrencyService.swift
//  Place
//
//  Created by Илья Миронов on 28/08/2019.
//  Copyright © 2019 Ilya Mironov. All rights reserved.
//

import Foundation
import Alamofire

enum ServiceResault<Value> {
    case success(Value)
    case failure(Error)
}

class CurrencyService {
    private enum Constans {
        static let apiKey = "14d76c8a2f5b71bf58ef7e5a0082da9b"
        static let baseURL = "http://data.fixer.io/api"
        static let error = NSError(domain: "CurrencyService", code: 0, userInfo: nil)
    }
    
    private enum EndPoints {
        static let latest = "/latest"
    }
    
    func obtainCurrency(for currencies: [TypeOfCurrency], complition: ((ServiceResault<CurrencyResult>) -> Void)?) {
        var urlComponents = URLComponents(string: Constans.baseURL + EndPoints.latest)
        let apiKey = URLQueryItem(name: "access_key", value: Constans.apiKey)
        let currencyString = currencies
            .map{"\($0.rawValue)"}
            .joined(separator: ",")
        
        let symbols = URLQueryItem(name: "symbols", value: currencyString)
        urlComponents?.queryItems = [apiKey, symbols]
        
        var request = URLRequest(url: (urlComponents?.url)!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                complition?(.failure(error!))
                return
            }
            guard let data = data else{
                complition?(.failure(Constans.error))
                return
            }
            do {
                let payload = try JSONDecoder().decode(CurrencyResult.self, from: data)
                complition?(.success(payload))
            } catch let error {
                complition?(.failure(error))
            }
        }
        task.resume()
    }
    
    func obtainCurrency2(for currencies: [TypeOfCurrency], complition: ((Result<CurrencyResult>) -> Void)?) {
        let url = URL(string: Constans.baseURL + EndPoints.latest)!
        let currencyString = currencies
            .map{"\($0.self)"}
            .joined(separator: ",")
        let parameters = ["access_key": Constans.apiKey,
                          "symbols": currencyString]
        let request = Alamofire.request(
            url,
            method: .get,
            parameters: parameters,
            encoding: URLEncoding.default,
            headers: nil)
        
        request.responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let payload = try JSONDecoder().decode(CurrencyResult.self, from: data)
                    complition?(.success(payload))
                } catch let error {
                    complition?(.failure(error))
                }
            case .failure(let error):
                complition?(.failure(error))
            }
        }
    
    
    }
}
