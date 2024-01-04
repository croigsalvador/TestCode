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
    }
    
    func start() {
        let tripCoordinator = TripListCoordinator()
        tripCoordinator.start()
        
        guard let rootViewController = tripCoordinator.rootViewController else { return }
        
        self.window.rootViewController = rootViewController
    }

    
}
