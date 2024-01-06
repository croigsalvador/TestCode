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
    
    var stopInfoApiModel: StopInfoApiModel {
        return StopInfoApiModel(
            price: 1.5,
            address: "Ramblas, Barcelona",
            tripId: 1,
            paid: true,
            stopTime: "2018-12-18T08:10:00.000Z",
            point: PointApiModel(latitude: 41.37653, longitude: 2.17924),
            userName: "Manuel Gomez"
        )
    }
}


