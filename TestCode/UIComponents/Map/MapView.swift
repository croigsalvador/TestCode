//
//  MapView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//
import SwiftUI
import MapKit

struct MapView: View {
    
    @Binding var region: MKCoordinateRegion
    var annotations: [CustomPointAnnotations]
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotations) { annotation in
            MapMarker(coordinate: annotation.coordinate, tint: .red)
        }
    }
}

