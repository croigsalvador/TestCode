//
//  GetTripLocationsMock.swift
//  TestCodeTests
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation
import CoreLocation
@testable import TestCode

class GetTripAnnotablesMock: GetTripAnnotables {
    
    var annotables: [Annotatable]!
    
    func annotables(_ trip: Trip) -> [Annotatable] {
        return annotables
    }
    
}
