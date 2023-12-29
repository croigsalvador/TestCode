//
//  TripListViewState.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 29/12/23.
//

import Foundation

enum TripListState {
    case idle
    case loading
    case loaded
    case error
}

class TripListViewState: ObservableObject {
    
    @Published var listState: TripListState = .idle 
    
}
