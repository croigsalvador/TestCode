//
//  ErrorView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import SwiftUI

struct ErrorView: View {
    
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack {
            Text(title)
                .errorTitleModifier()
            Divider()
                .padding(8)
            Text(subtitle)
                .errorSubtitleModifier()
                .multilineTextAlignment(.center)
        }.padding(30)
    }
}

extension View {

    func errorTitleModifier() -> some View {
        self.modifier(ErrorTitleModifier())
    }
    
    func errorSubtitleModifier() -> some View {
        self.modifier(ErrorSubtitleModifier())
    }
}

struct ErrorTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.foregroundColor(Color.theme.errorSubtitleTextColor)
            .font(Font.theme.highlightFont )
    }
}

struct ErrorSubtitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.foregroundColor(Color.theme.errorSubtitleTextColor)
            .font(Font.theme.highlightFont )
    }
}
