//
//  DailyForecast.swift
//  WhethApp?
//
//  Created by Егор Белоцкий on 2.08.22.
//

import SwiftUI

struct DailyForecastView: View {
    @ObservedObject var wheatherService = WheatherSevice.shared
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                if let dailyWeather = wheatherService.wheather?.dailyWheather {
                    ForEach(dailyWeather, id: \.date) { weather in
                        HStack(spacing: 20) {
                            Text("\(weather.date)")
                            
                            HStack {
                                Image(systemName: "wind")
                                Text("\(Double(weather.windSpeed))" + "m/s")
                                    .frame(alignment: .center)
                            }
                            
                            HStack {
                                Image(systemName: "humidity")
                                Text("\(weather.humidity)%")
                            }
                            
                            Text("\(Int(weather.dailyTemp))" + "°C")
                                .bold()
                        }
                    }
                }
            }
        }
    }
}

