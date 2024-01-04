//
//  FetchTripsImpl.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation
import Combine

struct FetchTripsImpl: FetchTrips {
    
    private let repository: TripRepository
    
    init(_ repository: TripRepository) {
        self.repository = repository
    }
    
    func fetchTrips() -> AnyPublisher<[Trip], BasicError> {
        return repository.fetchTrips()
    }
    
}
