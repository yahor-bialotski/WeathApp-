//
//  File.swift
//  WhethApp?
//
//  Created by Егор Белоцкий on 26.07.22.
//

import Foundation

struct Response: Decodable  {
    var timezone: String
    var current: TemperatureInfo
    var daily: [DailyWheather]
}

struct City: Decodable {
    var name: String
}

struct TemperatureInfo: Decodable {
    var currentDate: Int
    var temp: Double
    var humidity: Int
    var windSpeed: Double
    var weather: [WeatherDescription]
    
    enum CodingKeys: String, CodingKey {
        case currentDate = "dt"
        case temp
        case humidity
        case windSpeed = "wind_speed"
        case weather
    }
}

struct WeatherDescription: Decodable {
    var description: String
}

// Daily struct

struct DailyWheather: Decodable {
    var dt: Int
    var temp: DayTemp
    var humidity: Int
    var wind_speed: Double
}

struct DayTemp: Decodable {
    var day: Double
}


