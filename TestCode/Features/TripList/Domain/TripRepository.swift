//
//  TripRepository.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation
import Combine

protocol TripRepository {
    func fetchTrips() -> AnyPublisher<[Trip], BasicError>
}
