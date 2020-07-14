
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
           let weather = OpenWeatherMapService()
           let service = RequestCall(networkCall: NetworkCall(session: URLSessionFake(data: FakeResponseData.weatherCorrectData, response: FakeResponseData.responseOK, error: nil)))
           // When
           let expectation = XCTestExpectation(description: "Wait for queue change")
           
           service.request(baseUrl: url, parameters: [("key", "AIzaSyAMNKz9mGeJTt_p1c-RBaivHdLj1ZNYAPA"), ("source", "fr"), ("target", "en"), ("format", "text"), ("q", "Bonjour")]) {  (result: Result<TranslateData, NetWorkError>) in
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

}
