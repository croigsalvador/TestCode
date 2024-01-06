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
    @Published var popUpState: PopUpViewState
    @Published var showPopUp: Bool = false
    private var cancellables: Set<AnyCancellable> = []
    private let fetchTrips: FetchTrips
    private let getTripAnotables: GetTripAnnotables
    private let regionCalculator: RegionCalculator
    private let getStopInfo: GetStopInfo
    
    init(listState: TripListState = .idle,
         mapState: MapViewState = MapViewState(),
         popUpState: PopUpViewState = .idle,
         fetchTrips: FetchTrips,
         getTripAnotables: GetTripAnnotables,
         regionCalculator: RegionCalculator,
         getStopInfo: GetStopInfo) {
        self.listState = listState
        self.mapState = mapState
        self.popUpState = popUpState
        self.fetchTrips = fetchTrips
        self.getTripAnotables = getTripAnotables
        self.regionCalculator = regionCalculator
        self.getStopInfo = getStopInfo
    }
    
    func onAppear() {
        for family in UIFont.familyNames {
            print("\(family)")
            for names in UIFont.fontNames(forFamilyName: family) {
                print("== \(names)")
            }
        }
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
        popUpState = .idle
        if let stopAnnotation = annotation as? StopAnnotation {
            getInfo(stopAnnotation.stop)
        } else if let locationAnnotation = annotation as? LocationAnnotation {
            showPopUp = true
            popUpState = .showLocation(LocationUIModel(location: locationAnnotation.location))
        }
    }
    
    func getInfo(_ stop: Stop) {
        guard let stopId = stop.id else { return }
        
        getStopInfo.getInfo(id: stopId)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case .failure = completion {
                    self?.showPopUp = true 
                    self?.popUpState = .error
                }
            } receiveValue: { [weak self] stopInfo in
                self?.showPopUp = true
                self?.popUpState = .showStop(StopInfoUIModel(stopInfo: stopInfo))
            }.store(in: &cancellables)

    }
    
    func add() {}
    
}
