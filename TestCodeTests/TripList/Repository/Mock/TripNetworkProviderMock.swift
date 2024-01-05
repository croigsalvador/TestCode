//
//  TripNetworkProviderMock.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation
@testable import TestCode
import Combine

class TripNetworkProviderMock: TripNetworkProvider {
 
    var publisher: AnyPublisher<[TripApiModel], Error>!
    var stopInfoPublisher: AnyPublisher<StopInfoApiModel, Error>!
    
    func fetchtTrips() -> AnyPublisher<[TripApiModel], Error> {
        return publisher
    }
    
    func getStopInfo(id: Int) -> AnyPublisher<StopInfoApiModel, Error> {
        return stopInfoPublisher
    }
    
}
