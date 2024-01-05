//
//  GetTripLocationsImpl.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation
import CoreLocation

struct GetTripLocationsImpl: GetTripLocations {
    
    func locations(_ trip: Trip) -> [CLLocationCoordinate2D] {
        var points = [CLLocationCoordinate2D]()

        let startPoint = CLLocationCoordinate2D(latitude: trip.origin.point.latitude, longitude: trip.origin.point.longitude)
        points.append(startPoint)
        
        if let stops = trip.stops {
            for stop in stops {
                if let point = stop.point {
                    let stopPoint = CLLocationCoordinate2D(latitude: point.latitude, longitude: point.longitude)
                    points.append(stopPoint)
                }
            }
        }

        let endPoint = CLLocationCoordinate2D(latitude: trip.destination.point.latitude, longitude: trip.destination.point.longitude)
        points.append(endPoint)

        return points
    }
}
