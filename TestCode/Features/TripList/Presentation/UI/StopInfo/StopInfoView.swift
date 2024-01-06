//
//  StopInfoView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 5/1/24.
//

import SwiftUI

struct StopInfoView: View {
    
    var uiModel: StopInfoUIModel
    
    var body: some View {
        VStack {
            Text("Stop Information")
                .font(Font.theme.highlightFont)
                .foregroundColor(Color.theme.primaryTextColor)
                .padding()
                .frame(alignment: .center)
            VStack {
                Text(uiModel.address)
                    .padding(4)
                Text(uiModel.userName)
                    .padding(4)
                HStack {
                    Text(uiModel.price)
                    Text(uiModel.paid)
                }
                .padding()
            }.padding(8)
            .font(Font.theme.subtitleFont)
            .foregroundColor(Color.theme.primaryTextColor)
        }.cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black.opacity(0.1), lineWidth: 1))
            .background(Color.theme.primaryBackgroundColor)
    }
}

struct StopInfoView_Previews: PreviewProvider {
    static var previews: some View {
        StopInfoView(uiModel: StopInfoUIModel(stopInfo: DeveloperInstances.shared.stopInfoApiModel.toDomainModel()!))
    }
}
