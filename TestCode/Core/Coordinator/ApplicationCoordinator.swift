//
//  ApplicationCoordinator.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation
import SwiftUI
import UIKit
import Dip

class ApplicationCoordinator: ObservableObject, Coordinator {
    
    let window: UIWindow
    let container: DependencyContainer = DependencyContainer()
  
    init(window: UIWindow) {
        self.window = window
        setupDependencies()
    }
    
    func start() {
        guard let fetchTrips: FetchTrips = try? container.resolve() else {
            return
        }
        
        let viewModel = TripListViewModel(viewState: TripListViewState(), fetchTrips: fetchTrips)
//        
//        
//        let viewController = CustomHostingController(shouldShowNavigationBar: false, rootView: view)
//        self.window.rootViewController = UINavigationController(rootViewController: viewController)
    }
    
    private func setupDependencies() {
        container.register { URLSession.shared }
        container.register { TripNetworkProviderImpl(session: try self.container.resolve()) as TripNetworkProvider }
        container.register { TripRepositoryImpl(provider: try self.container.resolve()) as TripRepository }
        container.register { FetchTripsImpl(repository: try self.container.resolve()) as FetchTrips }
    }
    
}
