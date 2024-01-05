//
//  RegionCalculatorMock.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation
@testable import TestCode
import MapKit

class RegionCalculatorMock: RegionCalculator {
    
    var region: MKCoordinateRegion!
    
    func calculateForRoute(_ coordinates: [CLLocationCoordinate2D]) -> MKCoordinateRegion {
        return region
    }
    
    
}
