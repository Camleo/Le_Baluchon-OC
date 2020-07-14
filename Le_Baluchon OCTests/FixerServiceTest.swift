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
         
        
        
        // MARK: - Error
        func testGetCurrencyShouldPostFailedCallbackError() {
    
            // When
            let expectation = XCTestExpectation(description: "Wait for queue change")
            
            let fixer = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error)))
            
            fixer.request(baseUrl: url, parameters: [("access_key", "7258bbe934222b776996cf936cb19661"), ("symbols", "USD")]) { (result: Result<Currency, NetWorkError>) in
                guard case .failure(let error) = result else {
                    XCTFail("testFixerShouldPostFailedCallbackError")
                    return
                }
                
                XCTAssertNotNil(error)
                
                // Then
                expectation.fulfill()
            }
            
            wait(for: [expectation], timeout: 0.01)
        }
        
        // MARK: - No data
        func testGetCurrencyShouldPostFailedCallbackIfNodData() {
            // Given
            let fixer = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.incorrectData, response: nil, error: FakeResponseData.error)))
            // When
            let expectation = XCTestExpectation(description: "Wait for queue change")
            
            fixer.request(baseUrl: url, parameters: [("access_key", "7258bbe934222b776996cf936cb19661"), ("symbols", "USD")]) { (result: Result<Currency, NetWorkError>) in
                guard case .failure(let error) = result else {
                    XCTFail("testGetCurrencyShouldPostFailedCallbackIfNodData Fail")
                    return
                }
                
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 0.01)
        }
        
        // MARK: - Incorrect response
        func testGetCurrencyShouldPostFailedCallbackIfIncorrectResponse() {
            // Given
            let fixer = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.fixerCorrectData, response: FakeResponseData.responseKO, error: nil)))
            // When
            let expectation = XCTestExpectation(description: "Wait for queue change")

             fixer.request(baseUrl: url, parameters: [("access_key", "7258bbe934222b776996cf936cb19661"), ("symbols", "USD")]) { (result: Result<Currency, NetWorkError>) in
                guard case .failure(let error) = result else {
                    XCTFail("testGetCurrencyShouldPostFailedCallbackIfIncorrectResponse")
                    return
                }
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 0.01)
        }

        // MARK: - Undecodable data
        func testGetCurrencyShouldPostFailedCallbackIfIncorrectData() {
            // Given
            let fixer = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.incorrectData, response: FakeResponseData.responseOK, error: nil)))
            // When
            let expectation = XCTestExpectation(description: "Wait for queue change")

             fixer.request(baseUrl: url, parameters: [("access_key", "7258bbe934222b776996cf936cb19661"), ("symbols", "USD")]) { (result: Result<Currency, NetWorkError>) in
                guard case .failure(let error) = result else {
                    XCTFail("testGetCurrencyShouldPostFailedCallbackIfIncorrectData")
                    return
                }

                XCTAssertNotNil(error)
                //Then
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 0.01)
        }

        // MARK: - Success
        func testGetCurrencyShouldPostSuccessCallbackIfNoMissingData() {
            // Given
            let fixer = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.fixerCorrectData, response: FakeResponseData.responseOK, error: nil)))
            // When
            let expectation = XCTestExpectation(description: "Wait for queue change")

             fixer.request(baseUrl: url, parameters: [("access_key", "7258bbe934222b776996cf936cb19661"), ("symbols", "USD")]) { (result: Result<Currency, NetWorkError>) in
                guard case .success(let data) = result else {
                    XCTFail("testFixerShouldPostFailedCallbackError")
                    return
                }

                XCTAssertEqual(data.rates["USD"], 1.136913)
                // Then
                expectation.fulfill()
            }

            wait(for: [expectation], timeout: 0.01)
        }

}
