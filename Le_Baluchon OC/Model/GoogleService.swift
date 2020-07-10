//
//  CurrencyService.swift
//  Le_Baluchon OC
//
//  Created by rochdi ben abdeljelil on 03.07.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//

import Foundation
class GoogleService {
    
    let service: RequestCall
    init(service: RequestCall = RequestCall()) {
        self.service = service
    }
    func getTranslation(text: String, callback: @escaping(Result<String, NetWorkError>) -> Void) {
        guard let url = URL(string: "https://translation.googleapis.com/language/translate/v2") else { return }
        service.request(baseUrl: url, parameters: [("key", "AIzaSyAMNKz9mGeJTt_p1c-RBaivHdLj1ZNYAPA"), ("source", "fr"), ("target", "en"), ("format", "text"), ("q", text)]) {  (result: Result<TranslateData, NetWorkError>) in
            switch result {
            case.success(let data):
                callback(.success(data.data.translations[0].translatedText))
            case.failure(let error):
                callback(.failure(error))
                
            }
        }
    }
    
}
