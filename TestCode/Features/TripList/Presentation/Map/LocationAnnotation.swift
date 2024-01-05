//
//  LocationAnnotation.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation

class LocationAnnotation: CustomPointAnnotation {
    
    let location: Location
    
    init(location: Location) {
        self.location = location
        super.init()
    }
}
