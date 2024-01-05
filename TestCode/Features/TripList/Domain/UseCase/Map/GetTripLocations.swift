//
//  GetTripLocations.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation
import CoreLocation

protocol GetTripLocations {
    func locations(_ trip: Trip) -> [CLLocationCoordinate2D] 
}
