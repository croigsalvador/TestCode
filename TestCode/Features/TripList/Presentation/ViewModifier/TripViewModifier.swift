//
//  TripViewModifier.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import Foundation
import SwiftUI

extension View {

    func timeViewModifier() -> some View {
        self.modifier(TimeViewModifier())
    }
}


struct TimeViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.foregroundColor(Color.theme.primaryTextColor)
            .font(Font.theme.subtitleFont )
    }
}

