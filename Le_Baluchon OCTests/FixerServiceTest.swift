//
//  FixerServiceTest.swift
//  Le_Baluchon OCTests
//
//  Created by rochdi ben abdeljelil on 13.07.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//

@testable import Le_Baluchon_OC
import XCTest

class FixerServiceTest: XCTestCase {
    let requestCall = RequestCall()
    let url = URL(string: "http://data.fixer.io/api/latest")!
    
    
    func testGetCurrencyShouldPostFailedCallback_Error() {
        // Given
        let currency = FixerService()
        let service = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.fixerCorrectData, response: FakeResponseData.responseOK, error: nil)))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        
        service.request(baseUrl: url, parameters:[("access_key", "7258bbe934222b776996cf936cb19661"), ("symbols", "USD")]) {  (result: Result<Currency, NetWorkError>) in
            currency.getExchangeRate { result in
                guard case .failure(let error) = result else {
                    XCTFail("testFixerShouldPostFailedCallbackError")
                    return
                }
                XCTAssertNotNil(error)
                
                // Then
                expectation.fulfill()
            }
            
        }
    }
    
    func testGetCurrency_ShouldPostSuccessCallBack_NoErrors() {
        //Given
        let translate = FixerService()
        let service = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.fixerCorrectData, response: FakeResponseData.responseOK, error: nil)))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        service.request(baseUrl: url, parameters: [("access_key", "7258bbe934222b776996cf936cb19661"), ("symbols", "USD")]) {  (result: Result<Currency, NetWorkError>) in
            
            translate.getExchangeRate() { result in
                guard case .success(let data) = result else {
                    XCTFail("testFixerShouldPostFailedCallBackError")
                    return
                }
                
                XCTAssertEqual(data, 1.139309)
                
                // Then
                expectation.fulfill()
            }
            self.wait(for: [expectation], timeout: 1.01)
        }
    }
    
}
