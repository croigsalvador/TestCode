//
//  TripElementView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//
import Foundation
import SwiftUI

protocol Theme {

    var primaryBackgroundColor: Color {get}
    var primaryTextColor: Color {get}
    var secondaryTextColor: Color {get}
    
    var errorTitleTextColor: Color {get}
    var errorSubtitleTextColor: Color {get}
    
    var titleFont: Font {get}
    var subtitleFont: Font {get}
    var highlightFont: Font {get}
}

extension Theme {
    var titleFont: Font {
        Font.defaultBoldFontWithSize(size: 16.0)
    }
    var subtitleFont: Font {
        Font.defaultRegularFontWithSize(size: 14.0)
    }
    var highlightFont: Font {
        Font.defaultSemiBoldFontWithSize(size: 14.0)
    }
}

extension Color {
    static let theme: Theme = MainTheme()
}

extension Font {
    static let theme: Theme = MainTheme()
    
    static func defaultBoldFontWithSize(size: CGFloat) -> Font {
        return Font.custom("Montserrat-Bold", size: size)
    }
    
    static func defaultSemiBoldFontWithSize(size: CGFloat) -> Font {
        return Font.custom("Montserrat-SemiBold", size: size)
    }
    
    static func defaultMediumFontWithSize(size: CGFloat) -> Font {
        return Font.custom("Montserrat-Medium", size: size)
    }
    
    static func defaultRegularFontWithSize(size: CGFloat) -> Font {
        return Font.custom("Montserrat-Regular", size: size)
    }
}
