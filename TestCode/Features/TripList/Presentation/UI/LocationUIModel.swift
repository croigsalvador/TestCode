//
//  LocationUIModel.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation

struct LocationUIModel {
    let location: Location
    
    var title: String {
        location.address
    }
}
