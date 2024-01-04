//
//  TripRouter.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation

enum TripRouter {
    case fetchTrips

    var baseURL: URL {
        URL(string: "https://sandbox-giravolta-static.s3.eu-west-1.amazonaws.com/tech-test/trips.json")!
    }

    var request: URLRequest {
        switch self {
        case .fetchTrips:
            return URLRequest(url: baseURL)
        }
    }
}
