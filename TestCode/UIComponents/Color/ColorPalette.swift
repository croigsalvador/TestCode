//
//  CollorPallete.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation
import SwiftUI

enum ColorPalette {
    case greyOne
    case greyTwo
    case greyThree
    case lightGreyOne
    case lightGreyTwo
    case magicMintLight
    case salsaRedLight
    case darkSlateLight
    case dodgerBlueLight
    case yolkYellowLight
    case darkSlate
    case dodgerBlue
    case magicMint
    case salsaRed
    case yolkYellow

    fileprivate static let associatedValues = [
        greyOne: Color(red: 0.19, green: 0.19, blue: 0.19),
        greyTwo: Color(red: 0.33, green: 0.33, blue: 0.34),
        greyThree: Color(red: 0.80, green: 0.84, blue: 0.85),
        lightGreyOne: Color(red:234.0/255.0, green:238.0/255.0, blue:239.0/255.0),
        lightGreyTwo: Color(red: 0.97, green: 0.98, blue: 0.98),
        magicMintLight: Color(red: 0.93, green: 1.00, blue: 0.95),
        salsaRedLight: Color(red: 1.00, green: 0.81, blue: 0.82),
        darkSlateLight: Color(red: 0.80, green: 0.84, blue: 0.85),
        dodgerBlueLight: Color(red: 0.78, green: 0.90, blue: 0.99),
        yolkYellowLight: Color(red: 1.00, green: 0.94, blue: 0.76),
        darkSlate: Color(red: 0.14, green: 0.35, blue: 0.36),
        dodgerBlue: Color(red: 0.34, green: 0.77, blue: 0.90),
        magicMint: Color(red: 0.69, green: 1.00, blue: 0.79),
        salsaRed: Color(red: 0.87, green: 0.22, blue: 0.40),
        yolkYellow: Color(red: 1.00, green: 0.75, blue: 0.00)
    ]

    var color: Color {
        return ColorPalette.associatedValues[self]!
    }
}

