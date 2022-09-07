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
            
            if wheatherService.wheather != nil {
                CityAndTempView(city: wheatherService.cityName?.city,
                                temperature: wheatherService.wheather?.currentTempriture)
                
                WeatherDescriptionView(windSpeed: wheatherService.wheather?.windSpeed,
                                       wheatherDescription: wheatherService.wheather?.wheatherDesciption,
                                       humidity: wheatherService.wheather?.humidity)
                
                DailyForecastView()
            }
            else {
                Spacer()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                    .accentColor(Color.white)
            }
            Spacer()
            AdsView()
            BottomFieldView()
        }
        .foregroundColor(.white)
        .padding()
        .background(Color(hue: 0.607, saturation: 0.932, brightness: 0.501))
    }
}
