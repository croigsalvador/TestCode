//
//  Trip.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 29/12/23.
//

import Foundation

struct Trip {
    let tripId: Int
    let driverName: String
    let description: String
    let endTime: String
    let startTime: String
    let address: String
    let point: Point
    
}

struct Point: Codable {
    let latitude: Double
    let longitude: Double
}
