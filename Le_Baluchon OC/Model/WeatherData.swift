//
//  WeatherData.swift
//  Le Baluchon
//
//  Created by rochdi ben abdeljelil on 05.06.2020.
//  Copyright © 2020 rochdi ben abdeljelil. All rights reserved.
//

import Foundation

struct WeatherData {
    
    let temperature: Double
    let conditionId: Int
    let cityName: String
    
    // Convert temperature into String to one decimal number
    var temperatureString: String { return String(format: "%.1f", temperature) }
    
    // check with calculate properties which value should be return to set imageView
    var conditionName: String { updateWeatherIcon(to:  conditionId) }
    
    func updateWeatherIcon(to id: Int) -> String {
//           switch id {
//           case 0...300 :
//               return "tstorm1"
//           case 301...500 :
//               return "shower3"
//           case 501...600 :
//               return "shower3"
//           case 601...700 :
//               return "snow4"
//           case 701...771 :
//               return "fog"
//           case 772...799 :
//               return "tstorm3"
//           case 800 :
//               return "sunny"
//           case 801...804 :
//               return "cloudy2"
//           case 900...903, 905...1000 :
//               return "tstorm3"
//           case 903 :
//               return "snow4"
//           case 904 :
//               return "sunny"
//
//           default :
//               return "Cloud-refresh"
//
//           }
        switch id {
               case 200...232:
                   return "bolt"
               case 300...321:
                   return "drizzle"
               case 500...531:
                   return "rain"
               case 600...622:
                   return "snow"
               case 701...781:
                   return "fog"
               case 800:
                   return "sunny"
               case 801...804:
                   return "cloud"
               default:
                   return ""
               }
       }
}
  


