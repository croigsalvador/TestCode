//
//  TripListViewModel.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 29/12/23.
//

import Foundation
import Combine
import MapKit
import Polyline

final class TripListViewModel: ObservableObject {
    
    @Published var listState: TripListState
    @Published var mapState: MapViewState
    private var cancellables: Set<AnyCancellable> = []
    private let fetchTrips: FetchTrips
    private let getTripAnotables: GetTripAnnotables
    private let regionCalculator: RegionCalculator
    
    init(listState: TripListState = .idle,
         mapState: MapViewState = MapViewState(),
         fetchTrips: FetchTrips,
         getTripAnotables: GetTripAnnotables,
         regionCalculator: RegionCalculator) {
        self.listState = listState
        self.mapState = mapState
        self.fetchTrips = fetchTrips
        self.getTripAnotables = getTripAnotables
        self.regionCalculator = regionCalculator
    }
    
    func onAppear() {
        fetchTripList()
    }
    
    private func fetchTripList() {
        listState = .loading
        
        fetchTrips.fetchTrips()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case .failure = completion {
                    self?.listState = .error
                }
            } receiveValue: { [weak self] trips in
                self?.listState = .loaded(trips.map{TripUIModel(trip: $0)})
            }.store(in: &cancellables)
    }
    
    func userDidSelect(uiModel: TripUIModel) {
        
        mapState.annotations.removeAll()
        
        let trip = uiModel.trip
        let annotables  = getTripAnotables.annotables(trip)
        
        let polyline = Polyline(encodedPolyline: trip.route)
        if let decodedCoordinates: [CLLocationCoordinate2D] = polyline.coordinates {
            mapState.route = MKPolyline(coordinates: decodedCoordinates, count: decodedCoordinates.count)
        }
        
        mapState.annotations = annotables.compactMap { CustomAnnotationFactory.createAnnotation($0) }
        mapState.mapRegion = regionCalculator.calculateForRoute(annotables.compactMap {$0.coordinate})
    }
    
    func userDidSelect(annotation: CustomPointAnnotation) {
        if let stopAnnotation = annotation as? StopAnnotation {
            
        } else if let locationAnnotation = annotation as? LocationAnnotation {
            
        }
    }
    
    func add() {}
    
}
