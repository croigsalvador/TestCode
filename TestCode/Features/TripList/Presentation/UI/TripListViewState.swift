//
//  TripListViewState.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 29/12/23.
//

import Foundation

enum TripListState {
    case idle
    case empty
    case loading
    case loaded([TripUIModel])
    case error
}

extension TripListState: Equatable {
    static func ==(lhs: TripListState, rhs: TripListState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading): return true
        case (.idle, .idle): return true
        case (.empty, .empty): return true
        case (.error, .error): return true
        default:
            return false
        }
    }
}

class TripListViewState: ObservableObject {
    
    @Published var listState: TripListState = .idle 
    
}
