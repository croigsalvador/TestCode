//
//  GetTripLocations.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation
import CoreLocation

protocol GetTripAnnotables {
    func annotables(_ trip: Trip) -> [Annotatable] 
}
