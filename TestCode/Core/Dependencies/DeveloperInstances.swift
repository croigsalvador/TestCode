//
//  DeveloperInstances.swift
//  RandomWeatherApp
//
//  Created by Carlos Roig Salvador on 13/12/23.
//

import Foundation

final class DeveloperInstances {
    static let shared = DeveloperInstances()
    
    var tripListViewModel: TripListViewModel {
        TripListViewModel(fetchTrips: fetchTrips, getTripAnotables: GetTripAnnotablesImpl(), regionCalculator: RegionCalculatorImpl(), getStopInfo: getStopInfo)
    }
    
    var fetchTrips: FetchTrips {
        FetchTripsImpl(repository: tripRepository)
    }
    
    var getStopInfo: GetStopInfo {
        GetStopInfoImpl(repository: tripRepository)
    }
    
    var tripRepository: TripRepository {
        TripRepositoryImpl(provider: tripProvider)
    }
    
    var tripProvider: TripNetworkProvider {
        TripNetworkProviderImpl(session: URLSession.shared)
    }
}
