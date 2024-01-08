//
//  ReportCoordinatorMock.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 7/1/24.
//

import Foundation
@testable import TestCode

final class ReportCoordinatorMock: ReportCoordinator {
    
    var wasCalled = false
    
    override func pop() {
        wasCalled = true 
    }
    
}
