//
//  LocationInfoView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import SwiftUI

struct LocationInfoView: View {
    var uiModel: LocationUIModel
    
    var body: some View {
        VStack {
            VStack {
                Text("Stop Information")
                    .font(Font.theme.highlightFont)
                    .foregroundColor(Color.theme.primaryTextColor)
                    .padding()
                    .frame(alignment: .center)
                VStack(spacing: 8, content: {
                    Text(uiModel.typeText)
                        .font(Font.theme.subtitleFont)
                        .foregroundColor(Color.theme.primaryTextColor)
                        .frame(alignment: .center)
                    Text(uiModel.address)
                        .font(Font.theme.subtitleFont)
                        .foregroundColor(Color.theme.primaryTextColor)
                }).padding(12)
            }
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black.opacity(0.1), lineWidth: 1))
            .background(Color.theme.primaryBackgroundColor)
        }
    }
}

