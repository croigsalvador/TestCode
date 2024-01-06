//
//  ButtonType.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import Foundation
import SwiftUI

enum ButtonType {
    case green
    case gray
    case disabled
    
    var backgroundColor: Color {
        switch self {
        case .green:
            return ColorPalette.darkSlate.color
        case .gray:
            return ColorPalette.lightGreyOne.color
        case .disabled:
            return ColorPalette.lightGreyTwo.color
        }
    }
    
    var tintColor: Color {
        switch self {
        case .green:
            return ColorPalette.magicMint.color
        case .gray:
            return ColorPalette.darkSlate.color
        case .disabled:
            return ColorPalette.lightGreyOne.color
        }
    }
    
    var backgroundImageColor: Color {
        switch self {
        case .green:
            return Color.black.opacity(0.4)
        case .gray:
            return ColorPalette.darkSlate.color.opacity(0.4)
        case .disabled:
            return Color.white.opacity(0.8)
        }
    }
}
