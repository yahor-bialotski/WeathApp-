//
//  DailyWheatherData.swift
//  WhethApp?
//
//  Created by Егор Белоцкий on 10.08.22.
//

import Foundation

struct DailyWheatherData {
    var date: String
    var dailyTemp: Double
    var humidity: Int
    var windSpeed: Double
    
    init(networkData: DailyWheather) {
        let dailyDate = Date(timeIntervalSince1970: Double(networkData.dt))
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd MMM"
        let dateString = dayTimePeriodFormatter.string(from: dailyDate)
        
        self.date = dateString
        self.dailyTemp = networkData.temp.day
        self.humidity = networkData.humidity
        self.windSpeed = networkData.wind_speed
    }
}
