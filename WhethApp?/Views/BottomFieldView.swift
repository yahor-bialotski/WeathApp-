//
//  BottonFieldView.swift
//  WhethApp?
//
//  Created by Егор Белоцкий on 9.08.22.
//

import SwiftUI

struct BottomFieldView: View {
    @ObservedObject var wheatherService = WheatherSevice.shared
    @ObservedObject var geolocationModel = GeolocationViewModel.shared
    
    var body: some View {
        HStack {
            Button {
                if let latitude = geolocationModel.locationManager.location?.coordinate.latitude,
                   let longitude = geolocationModel.locationManager.location?.coordinate.longitude {
                    wheatherService.getNetworkWheatherData(latitude: latitude, longtitude: longitude)
                }
            } label: {
                Image(systemName: "location.circle.fill")
            }
            
            .frame(width: 60, height: 60)
            .background(Color.blue)
            .cornerRadius(30)
        }
    }
}
