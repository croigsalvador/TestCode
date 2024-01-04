//
//  TripListViewModel.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 29/12/23.
//

import Foundation
import Combine

final class TripListViewModel: ObservableObject {
    
    @Published var viewState: TripListState
    @Published var viewMapState: TripMapViewState = TripMapViewState()
    private let fetchTrips: FetchTrips
    private var cancellables: Set<AnyCancellable> = []
    
    init(fetchTrips: FetchTrips) {
        self.viewState = .idle
        self.fetchTrips = fetchTrips
    }
    
    func onAppear() {
        fetchTripList()
    }
    
    private func fetchTripList() {
        viewState = .loading
        
        fetchTrips.fetchTrips()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case .failure = completion {
                    self?.viewState = .error
                }
            } receiveValue: { [weak self] trips in
                self?.viewState = .loaded(trips.map{TripUIModel(trip: $0)})
            }.store(in: &cancellables)
    }
    
    func add() {}
    
}
