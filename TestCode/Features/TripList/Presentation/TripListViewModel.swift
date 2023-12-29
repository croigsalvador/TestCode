//
//  TripListViewModel.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 29/12/23.
//

import Foundation
import Combine

final class TripListViewModel: ObservableObject {
    
    @Published var viewState: TripListViewState
    private let fetchTrips: FetchTrips
    private var cancellables: Set<AnyCancellable> = []
    
    init(viewState: TripListViewState, fetchTrips: FetchTrips) {
        self.viewState = viewState
        self.fetchTrips = fetchTrips
    }
    
    func onAppear() {
        fetchTripList()
    }
    
    private func fetchTripList() {
        viewState.listState = .loading
        
        fetchTrips.fetchTrips()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case .failure = completion {
                    self?.viewState.listState = .error
                }
            } receiveValue: { [weak self] trips in
                self?.viewState.listState = .loaded(trips.map{TripUIModel(trip: $0)})
            }.store(in: &cancellables)
    }
    
}
