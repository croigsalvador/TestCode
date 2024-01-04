//
//  TripUIModel.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 29/12/23.
//

import Foundation

class TripUIModel: Identifiable {
    
    let trip: Trip
    
    init(trip: Trip) {
        self.trip = trip
    }
    
    var id: Int {
        trip.id
    }
    
    var title: String {
        trip.description
    }
}
