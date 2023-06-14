//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by Nikos Galinos on 1/6/23.
//

import Foundation
import Combine


class WeatherViewModel:ObservableObject {
    
    private var weatherService=WeatherService()
    
   @Published var weather = Weather()
    

    
    
    
    var temperature : String {
        if let temperature=self.weather.temp {
            return String(format: "%.0f", (temperature-273.15)) + " ℃"
        }else{
            return ""
        }
    }
    
    var humidity : String {
        if let humidity=self.weather.humidity {
            return String(format: "%.0f", humidity)
        }else{
            return ""
        }
    }
    
    var cityName : String = ""
    
    func search(){
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            fetchWeather(city: city)}
            
    }
    
    
    
    
    //we get the result (fetch the data) from the service (the getWeather function) into a new published variable
    func fetchWeather (city : String){
        self.weatherService.getWeather(city: city) {weather in
            if let weather = weather{
                DispatchQueue.main.async{
                    self.weather=weather

                }
            }
        }
    }
    
    
    
}
