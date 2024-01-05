//
//  GetTripLocationsImpl.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation
import CoreLocation

struct GetTripAnnotablesImpl: GetTripAnnotables {
    
    func annotables(_ trip: Trip) -> [Annotatable] {

        var annotables = [Annotatable]()

        annotables.append(trip.origin)
        
        if let stops = trip.stops {
            for stop in stops {
                annotables.append(stop)
            }
        }

        annotables.append(trip.destination)

        return annotables
    }
}
