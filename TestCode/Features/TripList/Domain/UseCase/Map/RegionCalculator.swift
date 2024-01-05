//
//  RegionCalculator.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation
import MapKit

protocol RegionCalculator {
    func calculateForRoute(_ coordinates: [CLLocationCoordinate2D]) -> MKCoordinateRegion
}

