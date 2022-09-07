//
//  WeatherDescriptionView.swift
//  WhethApp?
//
//  Created by Егор Белоцкий on 5.08.22.
//

import SwiftUI

struct WeatherDescriptionView: View {
    let windSpeed: Double?
    let wheatherDescription: String?
    let humidity: Int?
    
    var body: some View {
        HStack(spacing: 30) {
            VStack {
                Image(systemName: "wind")
                if let windSpeed = windSpeed {
                    Text("\(windSpeed)" + "m/s")
                }
            }
            
            VStack {
                Image(systemName: "sun.max.fill")
                
                if let wheatherDescription = wheatherDescription {
                    Text("\(wheatherDescription)")
                }
            }
            
            VStack {
                Image(systemName: "humidity")
                if let humidity = humidity {
                    Text("\(humidity) %")
                }
            }
        }
//        .frame(maxWidth: .infinity)
        .padding()
        .border(Color.white, width: 1)
    }
}

