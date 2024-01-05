//
//  TripRouter.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation

enum TripRouter {
    case fetchTrips
    case getStopInfo(id: Int)

    static let baseURL = URL(string: "https://sandbox-giravolta-static.s3.eu-west-1.amazonaws.com/tech-test")!
    
    var path: String {
        switch self {
        case .fetchTrips:
            return "trips.json"
        case .getStopInfo(_):
            return "stops.json"
        }
    }

    var request: URLRequest {
        let url = TripRouter.baseURL.appendingPathComponent(path)

        return URLRequest(url: url)
    }
}
