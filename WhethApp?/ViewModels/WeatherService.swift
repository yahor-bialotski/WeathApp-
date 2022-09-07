//
//  PostListViewModels.swift
//  WhethApp?
//
//  Created by Егор Белоцкий on 26.07.22.
//

import CoreLocation
import Foundation

class WheatherSevice: ObservableObject {
    @Published var wheather: CurrentWheatherData?
    @Published var coordinates: CityCoordinates?
    @Published var cityName: CityName?
    
    static let shared = WheatherSevice()
    
    private init() { }
    
    func loadWeather(city: String) {
        getCityCoordinates(city) { latitude, longitude in
            self.getNetworkWheatherData(latitude: latitude, longtitude: longitude)
        }
    }
    
    func getCityCoordinates(_ city: String, callback: @escaping (Double, Double) -> Void) {
        CLGeocoder().geocodeAddressString(city) { cities, error in
            guard let cityLocation = cities?.first?.location else { return }
            callback(cityLocation.coordinate.latitude,
                     cityLocation.coordinate.longitude)
            
            let cityCoordinates = CityCoordinates(cityLatitude: cityLocation.coordinate.latitude, cityLongitude: cityLocation.coordinate.longitude)
            
            DispatchQueue.main.async {
                self.coordinates = cityCoordinates
            }
            
            if let latitude = self.coordinates?.cityLatitude,
               let longitude = self.coordinates?.cityLongitude {
                self.getNetworkWheatherData(latitude: latitude, longtitude: longitude)
            }
        }
    }
    
    func getNetworkWheatherData(latitude: Double, longtitude: Double) {
        let langStr = Locale.current.languageCode
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longtitude)&lang=\(langStr ?? "de")&exclude=minutely&units=metric&appid=8ec3071b97671c6aeaaf91466c5b453f") else { return }
        
        guard let getCityUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longtitude)&lang=\(langStr ?? "de")&appid=8ec3071b97671c6aeaaf91466c5b453f") else { return }
        
        let urlRequest = URLRequest(url: url)
        let getCityUrlRequest = URLRequest(url: getCityUrl)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data,
                  let networkWheatherData = try? JSONDecoder().decode(Response.self, from: data) else { return }
            
            let wheatherData = CurrentWheatherData(networkData: networkWheatherData)
            print(wheatherData)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.wheather = wheatherData
            }
        }.resume()
        
        URLSession.shared.dataTask(with: getCityUrlRequest) { data, response, error in
            guard let data = data,
                  let networkCityData = try? JSONDecoder().decode(City.self, from: data) else { return }
            
            let cityData = CityName(networkData: networkCityData)
            print(cityData)
            
            DispatchQueue.main.async {
                self.cityName = cityData
            }
        }.resume()
    }
}

