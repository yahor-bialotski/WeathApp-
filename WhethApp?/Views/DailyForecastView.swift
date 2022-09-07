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
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                if let dailyWeather = wheatherService.wheather?.dailyWheather {
                    ForEach(dailyWeather, id: \.date) { weather in
                        HStack(spacing: 5) {
                            Text("\(weather.date)")
                            
                            Spacer()
                            
                            HStack {
                                Image(systemName: "wind")
                                Text("\(String(format: "%.2f", weather.windSpeed)) windSpeed")
                                    .frame(alignment: .center)
                            }
                            
                            Spacer()
                            
                            HStack {
                                Image(systemName: "humidity")
                                Text("\(weather.humidity)%")
                                    .minimumScaleFactor(0.5)
                            }
                            
                            Spacer()
                            
                            Text("\(Int(weather.dailyTemp))°C")
                                .bold()
                        }
                    }
                }
            }
        }
    }
}

