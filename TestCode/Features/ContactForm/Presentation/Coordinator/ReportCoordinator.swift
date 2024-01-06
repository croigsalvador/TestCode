//
//  ReportCoordinator.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import Foundation
import UIKit
import SwiftUI
import Dip

class ReportCoordinator: Coordinator {
    
    let container: DependencyContainer
    var rootViewController: UINavigationController?
    
    init(container: DependencyContainer = DependencyContainer()) {
        self.container = container
        setupDependencies()
    }
    func start() {
        guard let saveReport: SaveReport = try? container.resolve() else {
            return
        }
    }
    
    private func setupDependencies() {
   
    }
}
