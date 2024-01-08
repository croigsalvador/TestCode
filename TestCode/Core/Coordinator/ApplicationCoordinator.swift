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
    var childCoordinator: TripListCoordinator?
  
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        childCoordinator = TripListCoordinator()
        childCoordinator?.start()
        
        guard let rootViewController = childCoordinator?.rootViewController else { return }
        
        self.window.rootViewController = rootViewController
    }

    
}
