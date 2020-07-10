//
//  OpenWeatherMap.swift
//  Le_Baluchon OC
//
//  Created by rochdi ben abdeljelil on 03.07.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//

import Foundation
class OpenWeatherMapService {
    var weathersData = [WeatherData]()
    let service: RequestCall
    
    init(service: RequestCall = RequestCall()) {
        self.service = service
    }
    
    func getWeather(callback: @escaping (Result<[WeatherData], NetWorkError>) -> Void) {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/group") else { return }
        
        service.request(baseUrl: url, parameters: [("appid","a88a5d43892c1ee363b9648a11986896"), ("id", "5128581,524901"), ("units", "metric")]) { (result: Result<WeatherJSON, NetWorkError>) in
            switch result {
            case.success(let data):
                for i in 0..<data.cnt{
                    let weatherData = WeatherData(temperature: data.list[i].main.temp, conditionId: data.list[i].weather[0].id, cityName: data.list[i].name)
                    self.weathersData.append(weatherData)
                }
                callback(.success(self.weathersData))
            case.failure(let error):
                callback(.failure(error))
                
            }
        }
    }
}
