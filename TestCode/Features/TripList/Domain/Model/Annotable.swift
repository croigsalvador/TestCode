//
//  Annotable.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation
import CoreLocation

protocol Annotatable {
    var coordinate: CLLocationCoordinate2D {get}
    var point: Point {get}
}

extension Annotatable {
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: point.latitude, longitude: point.longitude)
    }
}
