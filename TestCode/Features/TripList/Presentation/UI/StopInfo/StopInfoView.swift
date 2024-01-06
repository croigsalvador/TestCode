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
                .font(Font.theme.titleFont)
                .foregroundColor(Color.theme.primaryTextColor)
                .padding(.bottom, 2)
                .frame(alignment: .center)
            
            VStack {
                Text(uiModel.address)
                    .padding()
                Text(uiModel.userName)
                    .padding()
                HStack {
                    Text(uiModel.price)
                    Text(uiModel.paid)
                }
                .padding()
            }.padding(8)
            .font(Font.theme.subtitleFont)
            .foregroundColor(Color.theme.primaryTextColor)
        }
    }
}

struct StopInfoView_Previews: PreviewProvider {
    static var previews: some View {
        StopInfoView(uiModel: StopInfoUIModel(stopInfo: DeveloperInstances.shared.stopInfoApiModel.toDomainModel()!))
    }
}
