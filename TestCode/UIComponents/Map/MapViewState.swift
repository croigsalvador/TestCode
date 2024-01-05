//
//  MapViewState.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation
import MapKit

class MapViewState: ObservableObject {
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    @Published var annotations: [CustomPointAnnotation] = []
    @Published var route: MKPolyline?

}
