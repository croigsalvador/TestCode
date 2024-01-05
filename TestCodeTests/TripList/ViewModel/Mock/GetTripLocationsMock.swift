//
//  GetTripLocationsMock.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation
import CoreLocation
@testable import TestCode

class GetTripLocationsMock: GetTripLocations {
    
    var coordinates: [CLLocationCoordinate2D]?
    
    func locations(_ trip: Trip) -> [CLLocationCoordinate2D] {
        return coordinates!
    }
    
}
