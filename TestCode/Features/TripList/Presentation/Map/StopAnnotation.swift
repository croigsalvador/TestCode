//
//  StopAnnotation.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation
import CoreLocation

class StopAnnotation: CustomPointAnnotation {
    
    let stop: Stop
    
    init(stop: Stop) {
        self.stop = stop
        super.init()
    }

}
