//
//  WheatherView.swift
//  WhethApp?
//
//  Created by Егор Белоцкий on 1.08.22.
//

import SwiftUI

struct WheatherView: View {
    @ObservedObject var wheatherService = WheatherSevice.shared
    
    var body: some View {
        VStack {
            CitySearchView()
            CityAndTempView(city: wheatherService.cityName?.city,
                            temperature: wheatherService.wheather?.currentTempriture)
            .padding()
            
            WeatherDescriptionView(windSpeed: wheatherService.wheather?.windSpeed, wheatherDescription: wheatherService.wheather?.wheatherDesciption, humidity: wheatherService.wheather?.humidity)
            
                .padding()
            
            DailyForecastView()
            AdsView()
            BottomFieldView()
        }
        
        .background(Color(hue: 0.607, saturation: 0.932, brightness: 0.501))
        .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WheatherView()
    }
}
