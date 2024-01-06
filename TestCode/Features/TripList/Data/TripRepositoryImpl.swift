//
//  TripRepositoryImpl.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation
import Combine

class TripRepositoryImpl: TripRepository {
    
    private let provider: TripNetworkProvider
    
    init(provider: TripNetworkProvider) {
        self.provider = provider
    }
    
    func fetchTrips() -> AnyPublisher<[Trip], BasicError> {
        return provider.fetchtTrips()
            .map { apiModels in
                apiModels.compactMap { $0.toDomainModel() }
            }
            .mapError { _ in .networkError }
            .eraseToAnyPublisher()
    }
    
    func getStopInfo(id: Int) -> AnyPublisher<StopInfo, BasicError> {
        return provider.getStopInfo(id: id)
            .tryMap { apiModel -> StopInfo in
                guard let stopInfo = apiModel.toDomainModel() else {
                    throw BasicError.unknownError 
                }
                return stopInfo
            }
            .mapError { _ in .networkError }
            .eraseToAnyPublisher()
    }
    
}
