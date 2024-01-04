//
//  TripElementView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation
import SwiftUI

extension View {

    func titleModifier() -> some View {
        self.modifier(TitleModifier())
    }
    
    func subtitleModifier() -> some View {
        self.modifier(SubtitleModifier())
    }
}

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.foregroundColor(Color.theme.primaryTextColor)
            .font(Font.theme.titleFont )
    }
}

struct SubtitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.foregroundColor(Color.theme.secondaryTextColor)
            .font(Font.theme.subtitleFont )
    }
}

