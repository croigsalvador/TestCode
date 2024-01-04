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
    
    var id: String {
        trip.description
    }
    
    var title: String {
        trip.description
    }
    
    var status: TripStatus {
        TripStatus(rawValue: trip.status) ?? .cancelled
    }
    
    var startTime: String {
        trip.startTime.hourDate
    }
    
    var endTime: String {
        trip.endTime.hourDate
    }
}

extension TripUIModel: Hashable {
    static func == (lhs: TripUIModel, rhs: TripUIModel) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
