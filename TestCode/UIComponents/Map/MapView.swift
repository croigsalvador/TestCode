//
//  MapView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//
import SwiftUI
import MapKit

struct MapView: View {
    
    @ObservedObject var mapState: MapViewState
    var selectedAnntation: ((CustomPointAnnotation)->())?
    
    var body: some View {
        MapPolylineOverlay(polyline: mapState.route, region: mapState.mapRegion, annotations:  mapState.annotations, strokeColor: UIColor.blue, lineWidth: 5, selectedAnntation: selectedAnntation)
    }
}
