//
//  TripElementView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation
import MapKit

class CustomPointAnnotations: MKPointAnnotation, Identifiable, ObservableObject {
    
    let id = UUID().uuidString
    
}
