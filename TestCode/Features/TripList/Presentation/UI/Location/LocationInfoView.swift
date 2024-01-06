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
            Text("Stop Information")
                .font(Font.theme.titleFont)
                .foregroundColor(Color.theme.primaryTextColor)
                .padding(.bottom, 2)
                .frame(alignment: .center)
            
            VStack {
                Text(uiModel.address)
                    .padding()
                    .padding()
            }.padding(8)
                .font(Font.theme.subtitleFont)
                .foregroundColor(Color.theme.primaryTextColor)
        }
    }
}

