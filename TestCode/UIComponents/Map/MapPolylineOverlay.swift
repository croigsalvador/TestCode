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
    var selectedAnntation: ((CustomPointAnnotation)->())?
    
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
        Coordinator(strokeColor: strokeColor, lineWidth: lineWidth, selectedAnntation: selectedAnntation)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var strokeColor: UIColor
        var lineWidth: CGFloat
        var selectedAnntation: ((CustomPointAnnotation)->())?
        
        init(strokeColor: UIColor, lineWidth: CGFloat, selectedAnntation: ((CustomPointAnnotation) -> ())?) {
            self.strokeColor = strokeColor
            self.lineWidth = lineWidth
            self.selectedAnntation = selectedAnntation
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
        
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            if let annotation = view.annotation as? CustomPointAnnotation {
                selectedAnntation?(annotation)
            }
            
        }
        
    }
}
