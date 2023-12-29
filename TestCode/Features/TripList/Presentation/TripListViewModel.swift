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
    
    init(viewState: TripListViewState) {
        self.viewState = viewState
    }
    
    func onAppear() {
       fetchTrips()
    }
    
    private func fetchTrips() {
        viewState.listState = .loading
    }
    
}
