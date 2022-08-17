//
//  WeatherData.swift
//  WhethApp?
//
//  Created by Егор Белоцкий on 27.07.22.
//

import Foundation

struct CurrentWheatherData {
    var timezone: String
    var currentDate: Int
    var currentTempriture: Double
    var humidity: Int
    var windSpeed: Double
    var wheatherDesciption: String
    
    var dailyWheather: [DailyWheatherData]
    
    init(networkData: Response) {
        self.timezone = networkData.timezone
        self.currentDate = networkData.current.currentDate
        self.currentTempriture = networkData.current.temp
        self.humidity = networkData.current.humidity
        self.windSpeed = networkData.current.windSpeed
        self.wheatherDesciption = networkData.current.weather.first?.description ?? ""
        
        var dailyWheather = [DailyWheatherData]()
        
        for data in networkData.daily {
            let dailyWeather = DailyWheatherData(networkData: data)
            dailyWheather.append(dailyWeather)
        }
        
        self.dailyWheather = dailyWheather
    } 
}
    
