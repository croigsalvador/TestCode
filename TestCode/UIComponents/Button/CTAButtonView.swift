//
//  CTAButtonView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import SwiftUI

struct CTAButtonView: View {
    
    let type: ButtonType
    let text: String
    let image: Image?
    let action: () -> Void
    var buttonWidth: CGFloat = 48
    
    var body: some View {
        VStack {
            Button(action: action) {
                HStack {
                    if  image != nil {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(type.backgroundImageColor)
                            .frame(width: buttonWidth, height: buttonWidth)
                            .padding(8)
                            .overlay(image!.foregroundColor(type.tintColor))
                    } else {
                        Spacer(minLength: buttonWidth)
                    }
                    Spacer()
                    HStack {
                        Text(text)
                            .multilineTextAlignment(.center)
                            .foregroundColor(type.tintColor)
                            .font(Font.theme.highlightFont)
                            .frame(height: 64)
                            .padding(.leading, -buttonWidth)
                    }
                    Spacer()
                }
                .background(RoundedRectangle(cornerRadius: 24)
                        .fill(type.backgroundColor))
                .padding(16)
                Spacer()
            }
        }.frame(height: 64)
    }
}
