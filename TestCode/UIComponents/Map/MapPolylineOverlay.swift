//
//  MapPolylineOverlay.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import SwiftUI
import MapKit

struct MapPolylineOverlay: UIViewRepresentable {
    var polyline: MKPolyline?
    var region: MKCoordinateRegion
    var annotations: [CustomPointAnnotation]
    var strokeColor: UIColor
    var lineWidth: CGFloat

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(region, animated: true)
        uiView.removeOverlays(uiView.overlays)
        if let polyline = polyline {
            uiView.addOverlay(polyline)
        }
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(annotations)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self, strokeColor: strokeColor, lineWidth: lineWidth)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapPolylineOverlay
        var strokeColor: UIColor
        var lineWidth: CGFloat

        init(_ parent: MapPolylineOverlay, strokeColor: UIColor, lineWidth: CGFloat) {
            self.parent = parent
            self.strokeColor = strokeColor
            self.lineWidth = lineWidth
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = strokeColor
                renderer.lineWidth = lineWidth
                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
    }
}
