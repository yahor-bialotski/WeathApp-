//
//  CitySearch.swift
//  WhethApp?
//
//  Created by Егор Белоцкий on 3.08.22.
//

import SwiftUI

struct CitySearchView: View {
    @State var searchedCity = ""
    @ObservedObject var viewModel = WheatherSevice.shared
    
    var body: some View {
        HStack(spacing: 10) {
            TextField("Enter city name", text: $searchedCity)
                .padding()
                .textFieldStyle(.roundedBorder)
                .foregroundColor(.black)
            
            Button(action: {viewModel.loadWeather(city: searchedCity)}, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.blue)
                        .frame(width: 35, height: 35)
                    
                    Image(systemName: "magnifyingglass.circle.fill")
                }
            })
        }
    }
}

struct CitySearch_Previews: PreviewProvider {
    static var previews: some View {
        CitySearchView()
    }
}
