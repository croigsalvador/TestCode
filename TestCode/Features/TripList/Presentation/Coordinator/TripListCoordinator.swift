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
    var childCoordinator: Coordinator?
    
    init(container: DependencyContainer = DependencyContainer()) {
        self.container = container
        setupDependencies()
    }

    func start() {
        guard let fetchTrips: FetchTrips = try? container.resolve(),
              let regionCalculator: RegionCalculator = try? container.resolve(),
              let getTripAnnotables: GetTripAnnotables = try? container.resolve(),
              let getStopInfo: GetStopInfo = try? container.resolve() else {
            return
        }
        
        let viewModel = TripListViewModel(coordinator: self, fetchTrips: fetchTrips, getTripAnotables: getTripAnnotables, regionCalculator: regionCalculator, getStopInfo: getStopInfo)
        let view = TripListView(viewModel: viewModel)
        
        let viewController = CustomHostingController(shouldShowNavigationBar: false, rootView: view)
        self.rootViewController = UINavigationController(rootViewController: viewController)
    }
    
    func showContactForm(){
        let reportCoordinator = ReportCoordinator()
        reportCoordinator.start()
        
        childCoordinator = reportCoordinator
        
        if let viewController = reportCoordinator.rootViewController {
            rootViewController?.pushViewController(viewController, animated: true)
        }
    }
        
    private func setupDependencies() {
        container.register { URLSession.shared }
        container.register { TripNetworkProviderImpl(session: try self.container.resolve()) as TripNetworkProvider }
        container.register { TripRepositoryImpl(provider: try self.container.resolve()) as TripRepository }
        container.register { FetchTripsImpl(repository: try self.container.resolve()) as FetchTrips }
        container.register { GetTripAnnotablesImpl() as GetTripAnnotables }
        container.register { RegionCalculatorImpl() as RegionCalculator }
        container.register { GetStopInfoImpl(repository: try self.container.resolve()) as GetStopInfo }
    }
    
}
