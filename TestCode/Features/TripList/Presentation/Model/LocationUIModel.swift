//
//  LocationUIModel.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation

struct LocationUIModel {
    let location: Location
   
    var typeText: String {
        location.type == .origin ? "Origin" : "Destination"
    }
    
    var address: String {
        location.address
    }
}
