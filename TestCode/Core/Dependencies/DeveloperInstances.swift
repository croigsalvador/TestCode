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
        TripListViewModel(fetchTrips: fetchTrips, getTripLocations: GetTripLocationsImpl(), regionCalculator: RegionCalculatorImpl())
    }
    
    var fetchTrips: FetchTrips {
        FetchTripsImpl(repository: tripRepository)
    }
    
    var tripRepository: TripRepository {
        TripRepositoryImpl(provider: tripProvider)
    }
    
    var tripProvider: TripNetworkProvider {
        TripNetworkProviderImpl(session: URLSession.shared)
    }
}
