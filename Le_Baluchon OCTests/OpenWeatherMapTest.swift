
//  OpenWeatherMapTest.swift
//  Le_Baluchon OCTests
//
//  Created by rochdi ben abdeljelil on 13.07.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.


@testable import Le_Baluchon_OC
import XCTest

class OpenWeatherMapTest: XCTestCase {
    
    let requestCall = RequestCall()
    let url = URL(string: "http://api.openweathermap.org/data/2.5/group")!
    
    func testGetWeatherShoulPostFailedCallBackError() {
        // Given
        let requestCall = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.weatherCorrectData, response: FakeResponseData.responseKO, error: nil)))
        let weather = OpenWeatherMapService(service: requestCall)
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        
        requestCall.request(baseUrl: url, parameters:  [("appid","a88a5d43892c1ee363b9648a11986896"), ("id", "5128581,524901"), ("units", "metric")]) {  (result: Result<WeatherJSON, NetWorkError>) in
            weather.getWeather { result in
                guard case .failure(let error) = result else {
                    XCTFail("testGetWeatherShoulPostFailedCallBackError fail")
                    return
                }
                
                XCTAssertNotNil(error)
                
                //Then
                expectation.fulfill()
            }
            
        }
        
    }
    
    func testGetWeather_ShouldPostSuccessCallBack_NoErrors() {
        // Given
        let requestCall = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.weatherCorrectData, response: FakeResponseData.responseOK, error: nil)))
        let weather = OpenWeatherMapService(service: requestCall)
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        
        requestCall.request(baseUrl: url, parameters:  [("appid","a88a5d43892c1ee363b9648a11986896"), ("id", "5128581,524901"), ("units", "metric")]) {  (result: Result<WeatherJSON, NetWorkError>) in
            weather.getWeather { result in
                guard case .success(let error) = result else {
                    XCTFail("testGetWeatherShoulPostFailedCallBackError")
                    return
                }
                XCTAssertEqual(0, 0)
            }
            // Then
            expectation.fulfill()
            
        }
        self.wait(for: [expectation], timeout: 0.01)
    }
}
