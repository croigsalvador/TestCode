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
        VStack(spacing: 20) {
            Text(uiModel.title)
        }
    }
}
