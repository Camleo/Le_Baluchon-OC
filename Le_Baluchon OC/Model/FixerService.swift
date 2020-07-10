//
//  FixerService.swift
//  Le_Baluchon OC
//
//  Created by rochdi ben abdeljelil on 03.07.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//

import Foundation
class FixerService {
    
    let service: RequestCall
    init(service: RequestCall = RequestCall()) {
        self.service = service 
    }
    func getExchangeRate(callback: @escaping (Result<Double, NetWorkError>) -> Void) {
         guard let url = URL(string: "http://data.fixer.io/api/latest") else { return }
        service.request(baseUrl: url, parameters: [("access_key", "7258bbe934222b776996cf936cb19661"), ("symbols", "USD")]) {  (result: Result<Currency, NetWorkError>) in
            switch result {
            case.success(let data):
                callback(.success(data.rates["USD"]!))
            case.failure(let error):
                callback(.failure(error))
                
            }
        }
    }
}
