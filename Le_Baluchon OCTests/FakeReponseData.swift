//
//  FakeReponseData.swift
//  Le_Baluchon OCTests
//
//  Created by rochdi ben abdeljelil on 07.07.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//

import Foundation
class FakeResponseData {
    //MARK: - Data
    static var weatherCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Weather", withExtension: ".json")!
        return try! Data(contentsOf: url)
    }
    
    static var fixerCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Fixer", withExtension: ".json")!
        return try! Data(contentsOf: url)
    }
    
    static var translateCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Translate", withExtension: ".json")!
        return try? Data(contentsOf: url)
    }
    
    static let incorrectData = "erreur".data(using: .utf8)
    
    //MARK: - Response
    static let responseOK = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 200, httpVersion: nil, headerFields: nil)
    
    static let responseKO = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 500, httpVersion: nil, headerFields: nil)
    
    
    //MARK: - Error
    class genericError: Error {}
    static let error = genericError()
    
    
    class FixerError: Error {}
    static let fixerError = FixerError()
}
