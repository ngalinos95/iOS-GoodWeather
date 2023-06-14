//
//  Weather.swift
//  GoodWeather
//
//  Created by Nikos Galinos on 1/6/23.
//

import Foundation

struct WeatherResposne:Decodable{
    let main:Weather
}


struct Weather : Decodable {
    
    var temp: Double?
    var humidity: Double?
    
    
}
