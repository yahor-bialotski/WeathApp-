//
//  ContentView.swift
//  WhethApp?
//
//  Created by Егор Белоцкий on 20.07.22.
//

import CoreLocation
import SwiftUI

struct ContentView: View {
    let viewModel = WheatherSevice.shared
    let geolocationViewModel = GeolocationViewModel.shared
    
    var body: some View {
        VStack {
            WheatherView()
        }
        .onAppear {
            geolocationViewModel.handleAppLaunch()
        }
    }
}

extension GeolocationViewModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        requestGeolocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first?.coordinate else {
            return
        }
        
        wheatherService.getNetworkWheatherData(latitude: location.latitude, longtitude: location.longitude)
    }
}
