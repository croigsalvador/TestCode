//
//  TripStatus.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation
import SwiftUI

enum TripStatus: String, Tag {
    case ongoing
    case cancelled
    case scheduled
    case finalized
    
    var text: String {
        self.rawValue.uppercased()
    }
    
    var textColor: Color {
        return Color.white
    }
    
    var backgroundColor: Color {
        switch self {
        case .ongoing:
            return ColorPalette.darkSlate.color
        case .cancelled:
            return ColorPalette.salsaRed.color
        case .scheduled:
            return ColorPalette.dodgerBlue.color
        case .finalized:
            return ColorPalette.yolkYellow.color
        }
    }
}
