//
//  TripNetworkProviderImpl.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation
import Combine

struct TripNetworkProviderImpl: TripNetworkProvider {
    
    let session: URLSession
    
    func fetchtTrips() -> AnyPublisher<[TripApiModel], Error> {
        session.dataTaskPublisher(for: TripRouter.fetchTrips.request)
               .map(\.data)
               .decode(type: [TripApiModel].self, decoder: JSONDecoder())
               .receive(on: DispatchQueue.main)
               .eraseToAnyPublisher()
    }
}
