//
//  WeatherJSON.swift
//  Le_Baluchon OC
//
//  Created by rochdi ben abdeljelil on 25.06.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//

import Foundation
struct WeatherJSON: Decodable {
    let cnt: Int
    let list: [List]
}

struct List: Decodable {
    let name: String
    let main: TemparatureData
    let weather: [Weather]
}

struct TemparatureData: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let id: Int
}
