//
//  CityNameData.swift
//  WhethApp?
//
//  Created by Егор Белоцкий on 16.08.22.
//

import Foundation

struct CityName {
    var city: String
    
    init(networkData: City) {
        self.city = networkData.name
    }
}
