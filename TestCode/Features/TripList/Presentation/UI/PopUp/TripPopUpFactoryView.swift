//
//  TripPopUpFactoryView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import SwiftUI

struct TripPopUpFactoryView: View {
    
    @ObservedObject var viewModel: TripListViewModel
    
    var body: some View {
        switch viewModel.popUpState {
        case .idle:
            Text("")
        case .error:
            PopUpView(content: ErrorView(title: "There was an error", subtitle: "Close and try again"), title: "Stop information", showingView: $viewModel.showPopUp)
        case .showStop(let uiModel):
            PopUpView(content: StopInfoView(uiModel: uiModel), title: "Stop information", showingView:$viewModel.showPopUp)
        case .showLocation(let locationUIModel):
            PopUpView(content: LocationInfoView(uiModel: locationUIModel).padding(20), title: "Stop information", showingView: $viewModel.showPopUp)
        }
    }
}

struct TripPopUpFactoryView_Previews: PreviewProvider {
    static var previews: some View {
        TripPopUpFactoryView(viewModel: DeveloperInstances.shared.tripListViewModel)
    }
}
