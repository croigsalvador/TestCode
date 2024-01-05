//
//  CustomAnnotationFactory.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation

class CustomAnnotationFactory {
    
    static func createAnnotation(_ element: Annotatable) -> CustomPointAnnotation? {
        if let stop = element as? Stop {
            let annotation = StopAnnotation(stop: stop)
            annotation.coordinate = stop.coordinate
            return annotation
        } else if let location = element as? Location {
            let annotation = LocationAnnotation(location: location)
            annotation.coordinate = location.coordinate
            return annotation
        }
        return nil
    }
    
}
