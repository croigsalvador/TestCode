//
//  TripListCoordinatorMock.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 8/1/24.
//

import Foundation
@testable import TestCode

final class TripListCoordinatorMock: TripListCoordinator {
 
    var wasCalled = false
    
    override func showContactForm() {
        wasCalled = true 
    }
}
