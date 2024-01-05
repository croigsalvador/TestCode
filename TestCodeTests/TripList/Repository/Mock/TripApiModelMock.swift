//
//  TripApiModelMock.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation
@testable import TestCode

extension TripApiModel {
    static var mock: TripApiModel {
        return TripApiModel(
            driverName: "John Doe",
            status: "ongoing",
            route: "Sample Route",
            startTime: "2020-01-01T08:00:00.000Z",
            endTime: "2020-01-01T09:00:00.000Z",
            origin: LocationApiModel.mock,
            destination: LocationApiModel.mock,
            stops: [
                StopApiModel.mock,
                StopApiModel(id: 2, point: PointApiModel(latitude: 41.45179, longitude: 2.16494)),
                StopApiModel(id: 3, point: PointApiModel(latitude: 41.43853, longitude: 2.01094))
            ],
            description: "Test trip from origin to destination with multiple stops"
        )
    }
    
    static var wrongDateMock: TripApiModel {
        return TripApiModel(
            driverName: "John Doe",
            status: "ongoing",
            route: "Sample Route",
            startTime: "",
            endTime: "",
            origin: LocationApiModel.mock,
            destination: LocationApiModel.mock,
            stops: [
                StopApiModel.mock,
                StopApiModel(id: 2, point: PointApiModel(latitude: 41.45179, longitude: 2.16494)),
                StopApiModel(id: 3, point: PointApiModel(latitude: 41.43853, longitude: 2.01094))
            ],
            description: "Test trip from origin to destination with multiple stops"
        )
    }
    
}

extension LocationApiModel {
    static var mock: LocationApiModel {
        return LocationApiModel(
            address: "123 Mock Street, Mocktown",
            point: PointApiModel(latitude: 41.38074, longitude: 2.18594)
        )
    }
}

extension PointApiModel {
    static var mock: PointApiModel {
        return PointApiModel(latitude: 41.38074, longitude: 2.18594)
    }
}

extension StopApiModel {
    static var mock: StopApiModel {
        return StopApiModel(
            id: 1,
            point: PointApiModel(latitude: 41.37653, longitude: 2.17924)
        )
    }
}

extension StopInfoApiModel {
    static var mock: StopInfoApiModel {
        return StopInfoApiModel(
            price: 1.5,
            address: "Ramblas, Barcelona",
            tripId: 1,
            paid: true,
            stopTime: "2018-12-18T08:10:00.000Z",
            point: PointApiModel(latitude: 41.37653, longitude: 2.17924),
            userName: "Manuel Gomez"
        )
    }
}


