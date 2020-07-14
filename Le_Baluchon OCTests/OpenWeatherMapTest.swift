//
//  OpenWeatherMapTest.swift
//  Le_Baluchon OCTests
//
//  Created by rochdi ben abdeljelil on 13.07.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//
//import Foundation
//
//@testable import Le_Baluchon_OC
//import XCTest
//
//class OpenWeatherMapTest: XCTestCase {
//    
//    let requestCall = RequestCall()
//        let url = URL(string: "http://api.openweathermap.org/data/2.5/group")!
//         
//        
//        
//        // MARK: - Error
//        func testGetWeatherShouldPostFailedCallbackError() {
//
//            let expectation = XCTestExpectation(description: "Wait for queue change")
//            
//            let fixer = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error)))
//            
//           fixer.request(baseUrl: url, parameters: [("appid","a88a5d43892c1ee363b9648a11986896"), ("id", "5128581,524901"), ("units", "metric")]) { (result: Result<WeatherJSON, NetWorkError>) in
//                guard case .failure(let error) = result else {
//                    XCTFail("testOpenWeatherMapShouldPostFailedCallbackError")
//                    return
//                }
//                
//                XCTAssertNotNil(error)
//                
//                // Then
//                expectation.fulfill()
//            }
//            
//            wait(for: [expectation], timeout: 0.01)
//        }
//        
//        // MARK: - No data
//        func testGetWeatherShouldPostFailedCallbackIfNodData() {
//            // Given
//            let fixer = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.incorrectData, response: nil, error: FakeResponseData.error)))
//            // When
//            let expectation = XCTestExpectation(description: "Wait for queue change")
//            
//            fixer.request(baseUrl: url, parameters: [("appid","a88a5d43892c1ee363b9648a11986896"), ("id", "5128581,524901"), ("units", "metric")]) { (result: Result<WeatherJSON, NetWorkError>) in
//                guard case .failure(let error) = result else {
//                    XCTFail("testGetWeatherShouldPostFailedCallbackIfNodData Fail")
//                    return
//                }
//                
//                XCTAssertNotNil(error)
//                expectation.fulfill()
//            }
//            wait(for: [expectation], timeout: 0.01)
//        }
//        
//        // MARK: - Incorrect response
//        func testGetWeatherShouldPostFailedCallbackIfIncorrectResponse() {
//            // Given
//            let fixer = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.fixerCorrectData, response: FakeResponseData.responseKO, error: nil)))
//            // When
//            let expectation = XCTestExpectation(description: "Wait for queue change")
//
//             fixer.request(baseUrl: url, parameters: [("appid","a88a5d43892c1ee363b9648a11986896"), ("id", "5128581,524901"), ("units", "metric")]) { (result: Result<WeatherJSON, NetWorkError>) in
//                guard case .failure(let error) = result else {
//                    XCTFail("testGetWeatherShouldPostFailedCallbackIfIncorrectResponse")
//                    return
//                }
//                XCTAssertNotNil(error)
//                expectation.fulfill()
//            }
//            wait(for: [expectation], timeout: 0.01)
//        }
//
//        // MARK: - Undecodable data
//        func testGetWeatherShouldPostFailedCallbackIfIncorrectData() {
//            // Given
//            let fixer = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.incorrectData, response: FakeResponseData.responseOK, error: nil)))
//            // When
//            let expectation = XCTestExpectation(description: "Wait for queue change")
//
//             fixer.request(baseUrl: url, parameters: [("appid","a88a5d43892c1ee363b9648a11986896"), ("id", "5128581,524901"), ("units", "metric")]) { (result: Result<WeatherJSON, NetWorkError>) in
//                guard case .failure(let error) = result else {
//                    XCTFail("testGetWeatherShouldPostFailedCallbackIfIncorrectData")
//                    return
//                }
//
//                XCTAssertNotNil(error)
//                //Then
//                expectation.fulfill()
//            }
//            wait(for: [expectation], timeout: 0.01)
//        }
//
//        // MARK: - Success
//        func testGetWeatherShouldPostSuccessCallbackIfNoMissingData() {
//            // Given
//            let fixer = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.weatherCorrectData, response: FakeResponseData.responseOK, error: nil)))
//            // When
//            let expectation = XCTestExpectation(description: "Wait for queue change")
//
//             fixer.request(baseUrl: url, parameters: [("appid","a88a5d43892c1ee363b9648a11986896"), ("id", "5128581,524901"), ("units", "metric")]) { (result: Result<WeatherJSON, NetWorkError>) in
//                guard case .success(let data) = result else {
//                    XCTFail("testOpenWeatherMapShouldPostFailedCallbackError")
//                    return
//                }
//
//                XCTAssertEqual( data.list[0].main.temp, Double(data.list[0].weather[0].id), data.list[0].name)
//                // Then
//                expectation.fulfill()
//            }
//
//            wait(for: [expectation], timeout: 0.1)
//        }
//}
