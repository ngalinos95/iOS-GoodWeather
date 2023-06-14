//
//  WeatherService.swift
//  GoodWeather
//
//  Created by Nikos Galinos on 1/6/23.
//

import Foundation

class WeatherService {
    
    func getWeather(city:String, completion: @escaping (Weather?) -> ()){
        
        // we create the url of the API
        guard let url=URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=0e751811ee1c73f3d95ef29a272c4c78")else{
            completion(nil)
            return
        }
        //we create the URL request to get [data,response,error] from the API service with URLSession
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let  data = data , error == nil else {
                completion(nil)
                return
            }
            
            //we decode the JSON data from data to a new variable weatherResponse : WeatherResponse
            let weatherResponse = try? JSONDecoder().decode(WeatherResposne.self, from: data)
            //we unwrap the weatherResponse to check if there is a value .If yes return in with completion(weather) else return completion(nil)
            if let weatherResponse = weatherResponse{
                let weather = weatherResponse.main
                completion(weather)
            }else{
                completion(nil)
            }
                
            
        }.resume()
        
    }
}
    
