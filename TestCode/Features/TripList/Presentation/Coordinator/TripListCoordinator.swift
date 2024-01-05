//
//  TripCoordinator.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation
import UIKit
import SwiftUI
import Dip

class TripListCoordinator: Coordinator {
    
    let container: DependencyContainer
    var rootViewController: UINavigationController?
    
    init(container: DependencyContainer = DependencyContainer()) {
        self.container = container
        setupDependencies()
    }

    func start() {
        guard let fetchTrips: FetchTrips = try? container.resolve(),
              let regionCalculator: RegionCalculator = try? container.resolve(),
              let getTripLocations: GetTripLocations = try? container.resolve() else {
            return
        }
        
        let viewModel = TripListViewModel(fetchTrips: fetchTrips, getTripLocations: getTripLocations, regionCalculator: regionCalculator)
        let view = TripListView(viewModel: viewModel)
        
        let viewController = CustomHostingController(shouldShowNavigationBar: false, rootView: view)
        self.rootViewController = UINavigationController(rootViewController: viewController)
    }
    
    private func setupDependencies() {
        container.register { URLSession.shared }
        container.register { TripNetworkProviderImpl(session: try self.container.resolve()) as TripNetworkProvider }
        container.register { TripRepositoryImpl(provider: try self.container.resolve()) as TripRepository }
        container.register { FetchTripsImpl(repository: try self.container.resolve()) as FetchTrips }
        container.register { GetTripLocationsImpl() as GetTripLocations }
        container.register { RegionCalculatorImpl() as RegionCalculator }
    }
    
}
