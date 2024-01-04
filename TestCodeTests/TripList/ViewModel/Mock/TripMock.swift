//
//  TripMock.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation
@testable import TestCode

extension Trip {
    static var mock: Trip {
        return Trip(
            driverName: "Jane Smith",
            status: "completed",
            route: "Mock Route",
            startTime: "2020-01-01T08:00:00.000Z".toDate(),
            endTime: "2020-01-01T09:00:00.000Z".toDate(),
            origin: Location.mock,
            destination: Location.mock,
            stops: [Stop.mock,
                    Stop(id: 2, point: Point(latitude: 41.45179, longitude: 2.16494)),
                    Stop(id: 3, point: Point(latitude: 41.43853, longitude: 2.01094))],
            description: "Mock trip description"
        )
    }
}

extension Location {
    static var mock: Location {
        return Location(
            address: "456 Test Avenue, Test City",
            point: Point.mock
        )
    }
}

extension Point {
    static var mock: Point {
        return Point(
            latitude: 41.38074,
            longitude: 2.18594
        )
    }
}

extension Stop {
    static var mock: Stop {
        return Stop(
            id: 1,
            point: Point.mock
        )
    }
}
