//
//  GoogleServiceTest.swift
//  Le_Baluchon OCTests
//
//  Created by rochdi ben abdeljelil on 13.07.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//
@testable import Le_Baluchon_OC
import XCTest

class GoogleServiceTest: XCTestCase {
    
    let requestCall = RequestCall()
    let url = URL(string: "https://translation.googleapis.com/language/translate/v2")!
    
    
    
    //MARK: - Error
    func testGetTranslationShouldPostFailedCallbackError() {
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        
        let fixer = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error)))
        
        fixer.request(baseUrl: url, parameters: [("key", "AIzaSyAMNKz9mGeJTt_p1c-RBaivHdLj1ZNYAPA"), ("source", "fr"), ("target", "en"), ("format", "text"), ("q", "Bonjour")]) {  (result: Result<TranslateData, NetWorkError>) in
            guard case .failure(let error) = result else {
                XCTFail("testGoogleShouldPostFailedCallbackError")
                return
            }
            
            XCTAssertNotNil(error)
            
            // Then
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    // MARK: - No data
    func testGetTranslationShouldPostFailedCallbackIfNodData() {
        // Given
        let fixer = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.incorrectData, response: nil, error: FakeResponseData.error)))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        
        fixer.request(baseUrl: url, parameters: [("key", "AIzaSyAMNKz9mGeJTt_p1c-RBaivHdLj1ZNYAPA"), ("source", "fr"), ("target", "en"), ("format", "text"), ("q", "Bonjour")]) {  (result: Result<TranslateData, NetWorkError>) in
            guard case .failure(let error) = result else {
                XCTFail("testGetTranslationShouldPostFailedCallbackIfNodData Fail")
                return
            }
            
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    // MARK: - Incorrect response
    func testGetTranslationShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let fixer = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.translateCorrectData, response: FakeResponseData.responseKO, error: nil)))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        
        fixer.request(baseUrl: url, parameters: [("key", "AIzaSyAMNKz9mGeJTt_p1c-RBaivHdLj1ZNYAPA"), ("source", "fr"), ("target", "en"), ("format", "text"), ("q", "Bonjour")]) {  (result: Result<TranslateData, NetWorkError>) in
            guard case .failure(let error) = result else {
                XCTFail("testGetTranslationShouldPostFailedCallbackIfIncorrectResponse")
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    // MARK: - Undecodable data
    func testGetTranslationShouldPostFailedCallbackIfIncorrectData() {
        // Given
        let fixer = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.incorrectData, response: FakeResponseData.responseOK, error: nil)))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        
        fixer.request(baseUrl: url, parameters: [("key", "AIzaSyAMNKz9mGeJTt_p1c-RBaivHdLj1ZNYAPA"), ("source", "fr"), ("target", "en"), ("format", "text"), ("q", "Bonjour")]) {  (result: Result<TranslateData, NetWorkError>) in
            guard case .failure(let error) = result else {
                XCTFail("testGetTranslationShouldPostFailedCallbackIfIncorrectData")
                return
            }
            
            XCTAssertNotNil(error)
            //Then
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    // MARK: - Success
    func testGetTranslationShouldPostSuccessCallbackIfNoMissingData() {
        // Given
        let fixer = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.translateCorrectData, response: FakeResponseData.responseOK, error: nil)))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        
        fixer.request(baseUrl: url, parameters: [("key", "AIzaSyAMNKz9mGeJTt_p1c-RBaivHdLj1ZNYAPA"), ("source", "fr"), ("target", "en"), ("format", "text"), ("q", "Bonjour")]) {  (result: Result<TranslateData, NetWorkError>) in
            guard case .success(let data) = result else {
                XCTFail("testGoogleShouldPostFailedCallbackError")
                return
            }
            
            XCTAssertEqual(data.data.translations[0].translatedText, "Hello")
            // Then
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldPostFailedCallback_Error() {
        // Given
        let translate = GoogleService()
        let service = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.translateCorrectData, response: FakeResponseData.responseOK, error: nil)))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        
        service.request(baseUrl: url, parameters: [("key", "AIzaSyAMNKz9mGeJTt_p1c-RBaivHdLj1ZNYAPA"), ("source", "fr"), ("target", "en"), ("format", "text"), ("q", "Bonjour")]) {  (result: Result<TranslateData, NetWorkError>) in
            translate.getTranslation(text: "") { result in
                guard case .failure(let error) = result else {
                    XCTFail("testGoogleShouldPostFailedCallbackError")
                    return
                }
                XCTAssertNotNil(error)
                
                // Then
                expectation.fulfill()
            }
            
        }
    }
    
    func testGetTranslation_ShouldPostSuccessCallBack_NoErrors() {
        //Given
        let translate = GoogleService()
        let service = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.translateCorrectData, response: FakeResponseData.responseOK, error: nil)))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        service.request(baseUrl: url, parameters: [("key", "AIzaSyAMNKz9mGeJTt_p1c-RBaivHdLj1ZNYAPA"), ("source", "fr"), ("target", "en"), ("format", "text"), ("q", "Bonjour")]) {  (result: Result<TranslateData, NetWorkError>) in
            
            translate.getTranslation(text: "Bonjour") { result in
                guard case .success(let data) = result else {
                    XCTFail("testGogleShouldPostFailedCallBackError")
                    return
                }
                
                XCTAssertEqual(data, "Hello")
                
                // Then
                expectation.fulfill()
            }
            self.wait(for: [expectation], timeout: 0.01)
        }
    }
    
}
