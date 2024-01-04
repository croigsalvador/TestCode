//
//  TripNetworkProvider.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation
import Combine

protocol TripNetworkProvider {
    func fetchtTrips() -> AnyPublisher<[TripApiModel], Error>
}
