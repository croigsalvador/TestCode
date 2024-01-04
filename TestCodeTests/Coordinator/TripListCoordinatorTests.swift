//
//  TripListCoordinatorTests.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import XCTest
@testable import TestCode
import Dip

final class TripListCoordinatorTests: XCTestCase {
    
    var sut: TripListCoordinator!

    override func setUpWithError() throws {
        sut = TripListCoordinator()
    }
        
    func test_startShouldCreateViewController() {
        sut.start()
        XCTAssertNotNil(sut.rootViewController)
    }
    
    func test_startShouldNotCreateViewController() {
        
        let container = DependencyContainer()
        sut = TripListCoordinator(container: container)
        
        container.reset()
        
        sut.start()
        
        XCTAssertNil(sut.rootViewController)
    }

}
