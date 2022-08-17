//
//  AdsView.swift
//  WhethApp?
//
//  Created by Егор Белоцкий on 11.08.22.
//

import SwiftUI

struct AdsView: View {
    var body: some View {
        VStack {
            Text("Your advertisment can be here!")
            Text("Call 937-99-92")
        }
        
        .frame(maxWidth: .infinity, maxHeight: 120)
        .foregroundColor(.blue)
        .background(Color.white)
        .cornerRadius(10)
        .font(.title2)
    }
}
