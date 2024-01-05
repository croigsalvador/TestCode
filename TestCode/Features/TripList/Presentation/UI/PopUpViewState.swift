//
//  PopUpViewState.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import Foundation

enum PopUpViewState {
    case idle
    case loading
    case error
    case showStop(StopInfoUIModel)
    case showLocation(LocationUIModel)
}

extension PopUpViewState: Equatable {
    static func ==(lhs: PopUpViewState, rhs: PopUpViewState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading): return true
        case (.idle, .idle): return true
        case (.error, .error): return true
        default:
            return false
        }
    }
}
