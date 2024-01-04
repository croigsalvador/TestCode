//
//  Trip.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 29/12/23.
//

import Foundation

struct Trip {
    let id: Int
    let driverName: String
    let description: String
    let startDate: Date?
    let endDate: Date?
    let address: String
    let point: Point
}

struct Point {
    let latitude: Double
    let longitude: Double
}
