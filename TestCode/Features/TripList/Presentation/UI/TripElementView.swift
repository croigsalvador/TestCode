//
//  TripElementView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import SwiftUI

struct TripElementView: View {
    let uiModel: TripUIModel

    var body: some View {
        VStack {
            HStack {
                Text(uiModel.title)
                    .titleModifier()
                Spacer()
                TagView(tag: uiModel.status)
            }
            Spacer()
            HStack {
                Text(uiModel.startTime)
                Image(systemName: "arrow.right")
                Text(uiModel.endTime)
                Spacer()
            }.timeViewModifier()
        }.padding(8)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black.opacity(0.1), lineWidth: 1))
    }
}
