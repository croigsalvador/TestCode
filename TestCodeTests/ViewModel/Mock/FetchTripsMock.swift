//
//  FetchTripsMock.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 29/12/23.
//

import Foundation
@testable import TestCode
import Combine

class FetchTripsMock: FetchTrips {
    
    var publisher: AnyPublisher<[Trip], BasicError>!
    
    func fetchTrips() -> AnyPublisher<[Trip], BasicError> {
        return publisher
    }
    
}
