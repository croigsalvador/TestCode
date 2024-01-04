//
//  Trip.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 29/12/23.
//

import Foundation

struct Trip {
    let driverName: String
    let status: String
    let route: String
    let startTime: Date
    let endTime: Date
    let origin: Location
    let destination: Location
    let stops: [Stop]?
    let description: String
}
