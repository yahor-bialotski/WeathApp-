//
//  Geolocation Delegate.swift
//  WhethApp?
//
//  Created by Егор Белоцкий on 28.07.22.
//

import Foundation
import CoreLocation

class GeolocationViewModel: NSObject, ObservableObject  {
    let locationManager = CLLocationManager()
    var wheatherService = WheatherSevice.shared
    
    static let shared = GeolocationViewModel()
    
    private override init() { }
    
    func handleAppLaunch() {
        locationManager.delegate = self
        
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            requestGeolocation()
            
            return
        }
        
        requestGeolocationPermission()
    }
    
    func requestGeolocationPermission() {
        locationManager.requestAlwaysAuthorization()
    }
    
    func requestGeolocation() {
        locationManager.requestLocation()
    }
}
