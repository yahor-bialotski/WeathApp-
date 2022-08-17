//
//  CityAndTempView.swift
//  WhethApp?
//
//  Created by Егор Белоцкий on 3.08.22.
//

import SwiftUI

struct CityAndTempView: View {
    let city: String?
    let temperature: Double?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(city ?? "-")
                    .bold().font(.title)
                Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute().locale(Locale(identifier: "en"))))")
                    .fontWeight(.light)
            }
            
            Spacer()
            
            VStack {
                if let currentTemp = temperature {
                    Text("\(Int(currentTemp))" + "°C")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                }
            }
        }
    }
}
