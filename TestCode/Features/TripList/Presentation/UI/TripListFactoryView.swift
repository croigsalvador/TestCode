//
//  TripListFactoryView.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 4/1/24.
//

import SwiftUI

struct TripListFactoryView: View {
    
    @ObservedObject var viewModel: TripListViewModel
    let columns = [GridItem(.flexible(minimum:16.0))]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            switch viewModel.viewState {
            case .idle:
                CustomProgressView()
            case .empty:
                ErrorView(title: "There aren't trips", subtitle: "")
            case .error:
                ErrorView(title: "Something has failed", subtitle: "There was an error. Press the button or tap on the screen to refresh")
            case .loading:
                CustomProgressView()
            case .loaded(let elements):
                ForEach(elements) { model in
                    TripElementView(uiModel: model)
                }
            }
        }
        .padding()

    }
}

struct TripListFactoryView_Previews: PreviewProvider {
    static var previews: some View {
        TripListFactoryView(viewModel: DeveloperInstances.shared.tripListViewModel)
    }
}
